# encoding: utf-8
class WelcomeController < ApplicationController
   def index
   	 if current_user 
	     if current_user.role == 'admin'
	       redirect_to :controller => 'rlcodes', :action => 'index'
       else
	       redirect_to :controller => 'results', :action => 'index'
	     end
	   end
     @country = params[:country].present? ? Country.find_by_id(params[:country][:id]) : Country.last #'Nigeria'
    end
end
