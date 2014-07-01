class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_country

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  private

  def check_country
    if params[:country].present? and params[:country][:id].present?
	@country = Country.find_by_id(params[:country][:id]) 
     elsif cookies[:country_id].present? 
	 @country = Country.find_by_id(cookies[:country_id]) 
     else 
	 @country = Country.first
    end
    cookies[:country_id] = @country.id
  end
end
