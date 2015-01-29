class SessionsController < ApplicationController
  skip_before_filter :authenticated?, except: :destroy

  def new
  end

  def create
    if params[:session] && authenticate(params[:session][:username], params[:session][:password])
      sign_in
      redirect_to root_url, success: 'Signed in!'
    else
      render :new, failure: 'Bad credentials.'
    end
  end

  def destroy
    sign_out
    redirect_to login_url
  end
end
