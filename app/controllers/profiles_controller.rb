class ProfilesController < ApplicationController
  def show

  	@user = User.find_by_username(params[:id])

  	if @user
  		@views = @user.views.all
  		render action: :show
  	else

  		render file: 'public/404', status: 404, formats: [:html]
  end
end
def view
@view = current_user.views.build if signed_in?
end
end

  		
