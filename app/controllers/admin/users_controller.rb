class Admin::UsersController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order("role DESC, email ASC")
    authorize [:admin, @users]
  end

  def show
  end

  def new
    @user = User.new
    authorize [:admin, @user]
  end

  def create
    @user = User.new(user_params)
    authorize [:admin, @user]
    if @user.save
      redirect_to @user, notice: 'user was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private
  def set_user
		@user = User.friendly.find(params[:id])
    authorize [:admin, @user]
  end

  def user_params
    params.require(:user).permit(:role, :username, :email, :password, :password_confirmation)
  end

end

