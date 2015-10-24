class UsersController < ApplicationController
  def login
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:token] = @user.token
      flash[:success] = "注册成功"
      redirect_to :root
    else
      flash[:fail] = @user.errors
      render :signup
    end
  end

  def create_login_session
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:token] = user.token
      redirect_to :root, success: "登录成功"
    else
      render :login, fail: "登录失败"
    end
  end

  def logout
    session[:token] = nil
    redirect_to :root
  end

  def setting
  end

  def bind_wechat
    current_user.update_attributes(
                        wechat: params[:wechat],
                        slack_webhook: params[:slack_webhook],
                        slack_channel:  params[:slack_channel])
    redirect_to :root, success: "设置成功"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :wechat, :slack_webhook, :slack_channel)
  end

end
