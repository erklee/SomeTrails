class Api::SessionsController < ApplicationController
  def show
    if current_user
      @user = current_user
      render 'api/users/show'
    else
      render json: { user: nil }
    end
  end

  def create
    @user = User.find_by_credentials(params[:credential], params[:password])

    if @user
      login!(@user)
      render 'api/users/show'
    else
      render json: { errors: ['invalid credentials'] }, 
        status: :unauthorized
    end
  end

  def destroy
    logout!
    render json: { message: 'log out successful' }
  end
end
