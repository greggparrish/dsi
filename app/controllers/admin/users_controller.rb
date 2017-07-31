class Admin::UsersController < Admin::ApplicationController
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
      redirect_to admin_users_path, notice: 'user was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize [:admin, @user]
  end

  def update
    if needs_password?(@user, user_params)
      if @user.update_with_password(user_params_password_update)
        redirect_to admin_users_path, notice: 'user updated.'
      else
        error = true
      end
    else
      if @user.update_without_password(user_params)
        redirect_to admin_users_path, notice: 'user updated.'
      else
        error = true
      end
    end

    if error
      redirect_to admin_users_path, notice: 'errors in form.'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => "User deleted."
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
    authorize [:admin, @user]
  end

  def user_params
    params.require(:user).permit(:role, :username, :email, :password, :password_confirmation)
  end

  def needs_password?(user, user_params)
    !user_params[:password].blank?
  end

end

