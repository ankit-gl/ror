class AuthController < ApplicationController
  before_action :require_user_logged_out!, only: %i[signup index]

  def index; end

  def signup
    @user = User.new
  end

  def createAccount
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: 'Your account has been created successfully'
    else
      flash.now[:notice] = 'Could not create account'
      render :signup, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
      session[:user_id] = user.id
      redirect_to home_path, notice: 'Logged in successfully'
    else
      flash.now[:notice] = 'Invalid email or password'
      render :index, status: :unprocessable_entity
    end
  end

  def logout
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
