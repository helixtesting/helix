scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
  puts 'start status report'
  fetch_emails
  puts 'End status scheduler'
end

def fetch_emails
  rlcode = Rlcode.order('created_at').last
  imap = Net::IMAP.new(Settings.imap_server, :ssl => (Settings.imap_ssl ? Settings.imap_ssl == 1 : false))
  imap.login(Settings.imap_email, Settings.imap_password)
  #imap = Net::IMAP.new('mail.helixtesting.com', :ssl => (Settings.imap_ssl ? Settings.imap_ssl == 1 : false))
  #imap.login('ddcresults@helixtesting.com', 'Dozerman1')
  imap.examine('INBOX')
  date = DateTime.parse(rlcode.created_at.to_s) unless rlcode.nil?
  since = "#{rlcode.nil? ? '1-Jan-2014' : "#{date.strftime('%d-%b-%Y')}"}"
  #imsgs = imap.search(['SINCE', since])
  msgs = imap.search(['NEW'])
  puts "New Messages to be processed are #{msgs}"
  msgs.each do |msgID|
   puts "Message being processed is #{msgID}"
    _body = imap.fetch(msgID, "RFC822")[0].attr["RFC822"]

    require 'mail'
    mail = Mail.new(_body)

    attachment = mail.attachments.first
    unless attachment.nil?
      fn = attachment.filename
      if fn.include? '.pdf'
        begin
          File.open('tmp/'+fn, "w+b", 0644) { |f| f.write attachment.decoded }
          path = File.join Rails.root, 'tmp/', fn
          reader = PDF::Reader.new(path)
          page = reader.pages.first
          code = page.raw_content.split('(Case: ').last.split(')').first
          summary = page.raw_content.split('(Probability of Paternity:)').last.split(')').first.split('(').last
          if code and summary
            rlcode = Rlcode.new
            rlcode.code = code
            rlcode.summary = summary
            file_path = File.join Rails.root, '/public', '/resource/'
            FileUtils.mkdir_p(file_path) unless File.exists?(file_path)
            rlcode.file_path = '/resource/' + fn
            File.open((File.join Rails.root, '/public')+rlcode.file_path, "w+b") { |f| f.write File.read(path) }
            File.delete path
            rlcode.save!
          end
        rescue Exception => e
          puts "Error : Unable to save data for #{fn} because #{e.message}"
        end
      end
    end
    imap.store(msgID, '+FLAGS', [:Seen])
  end
  #imap.expunge
  puts "Fetching emails"
  imap.logout
end
