class PageController < ApplicationController
  include PageHelper
  def index
    if user_signed_in?
      @user= welcome_user(current_user.email)
    else
      @user="Welcome"
    end
  end
end
