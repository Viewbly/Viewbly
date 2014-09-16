class DailyViewController < ApplicationController
	  #requires user to be logged in to access their views
  before_action :require_user

  def daily
  end

end
