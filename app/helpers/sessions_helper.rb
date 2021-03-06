# encoding: utf-8
module SessionsHelper

  def sign_in(user)
    cookies.signed[:remember_token] = [user.id, user.salt]
    cookies[:rember_token] = { :value => user.id,
                               :expires => 1.day.from_now }
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_broker
    Broker.valid_brokers.find_by_user_id(current_user.id) unless Broker.find_by_user_id(current_user.id).nil?
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "您无权访问此页,请先登录"
  end

  def store_location
    session[:return_to] = request.fullpath #cookie
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def clear_return_to
    session[:return_to] = nil
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end

#
# cookies[:rember_token] = { :value => user.id,
#                            :expires => 20.years.from.now.utc }
# User.find_by_id(cookies[:rember_token])
