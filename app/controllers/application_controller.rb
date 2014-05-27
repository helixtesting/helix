class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_country

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  private

  def check_country
    @country = params[:country].present? ? Country.find_by_id(params[:country][:id]) : Country.last #'Nigeria'
  end
end
