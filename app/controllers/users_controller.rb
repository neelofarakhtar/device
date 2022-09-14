class UsersController < ApplicationController
   def import
    # debugger
     User.import(params[:file])
    flash[:notice] = "Users data uploaded successfully"
    redirect_to users_url
   end

  def index
     @users = User.order(created_at: :desc)
  end
    
  def new
    @user = User.new
  end

  def create_user
    @user =User.create!(email: params[:email], password: params[:password])
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private
  def user_params
    params.require(:user).permit(:email,:password,{role_ids: []},:firstname,:lastname,:address,:mobile_number)
  end

end