class ExtranetUser < ActiveRecord::Base
  attr_accessible :password, :rl_code, :viewable_code

  def self.import(file)
    CSV.foreach(file.path, headers: false) do |row|
      next if row.empty?
      #item = row.first
      viewable_code = row[0] #item.split(',').first
      password = row[1] #item.split(',').last
      ExtranetUser.create!(viewable_code: viewable_code, password: password)
    end
  end
end

