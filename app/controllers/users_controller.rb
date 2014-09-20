class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  before_action :admin_user, only: :destroy

  def index
    @query = User.search do
        fulltext params[:search]
    end
    @users = @query.results
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to views_path, success: 'Thanks for signing up!' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    
    @user = User.find(params[:id])

if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
    end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to daily_path
    end

     def following
    @title = "Following"
    @users = User.find(params[:id])
    @users = User.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = User.find(params[:id])
    @users = User.all
    render 'show_follow'
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :username, :terms_of_service)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    
end
