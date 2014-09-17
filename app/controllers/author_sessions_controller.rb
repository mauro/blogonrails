class AuthorSessionsController < ApplicationController
  def new
  end
  
  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, message: 'You are now logged in.')
    else
      flash.now.alert = "Wrong Username or Password!"
      render action: :new
    end
  end
  
  def destroy
     logout
     redirect_to(:authors, message: 'You are now logged out!')
  end
end
