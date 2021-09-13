class AccessController < ApplicationController
    
  before_action :confirm_logged_in , :except =>[:login,:attempt_login,:logout] 

  def menu
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user=User.where(:email=>params[:email]).first
      if found_user
         authorized_user = found_user.authenticate(params[:password]) 
      end  
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] ="You are Now log in"
      redirect_to(access_menu_path)
    else
      flash.now[:notice] ="wrong id password"
      render('login')  
    end  


  end

  def logout
      session[:user_id] = nil
      flash[:notice]="succesfully Loged out"
      redirect_to(access_login_path)
  end

  private
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice]="Please Log in"
      redirect_to(access_login_path)
    end
  end

end
