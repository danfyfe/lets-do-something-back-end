class Api::V1::AuthController < ApplicationController



  def create
      @user = User.find_by(username: user_login_params[:username])
      if @user && @user.authenticate(user_login_params[:password])
        token = encode_token({user_id: @user.id})
        byebug
        render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
      else
        render json: { error: 'Invalid username and/or password'}, status: :unauthorized
      end
  end


    private
      def user_login_params
        params.require(:user).permit(:username,:password)
      end



end
