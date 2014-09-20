class SnapshotController < ApplicationController
	  #requires user to be logged in to access their views
  before_action :require_user

  def snapshot
  end

end
