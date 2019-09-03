class Api::V1::UsersController < ApplicationController

  def index
    # byebug
    @users = User.all
    render json: @users
  end

  def create
    if params[:user][:password] === params[:user][:passwordConfirm]
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id:@user.id)
        render json: { user:UserSerializer.new(@user), jwt: @token}, status: :created
      else
        render json: { error: @user.errors.full_messages.first}, status: :not_acceptable
      end
    else
      render json: { error: 'Passwords do not match!'}
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user)}, status: :accepted
  end

  def update_username
    @user = User.find_by(username: params[:username])
    if @user.update(update_username_params)
      render json: { user: UserSerializer.new(@user)}, status: :accepted
    else
      render json: { error: @user.errors.full_messages.first }
    end
  end

  def update_email
    @user = User.find_by(username: params[:username])
    if @user.update(update_email_params)
      render json: { user: UserSerializer.new(@user)}, status: :accepted
    else
      render json: { error: @user.errors.full_messages.first }
    end
  end

  def update_first_name
    @user = User.find_by(username: params[:username])
    if @user.update(update_first_name_params)
      render json: { user: UserSerializer.new(@user)}, status: :accepted
    else
      render json: { error: @user.errors.full_messages.first }
    end
  end

  def update_last_name
    @user = User.find_by(username: params[:username])
    if @user.update(update_last_name_params)
      render json: { user: UserSerializer.new(@user)}, status: :accepted
    else
      render json: { error: @user.errors.full_messages.first }
    end
  end


  def follow_request
    @user = User.find(params[:id])
    @requested_user = User.find_by(username:params[:request_username])
    @follow_request = FollowRequest.create(follower_id: @user.id, user_id: @requested_user.id, accepted: false)

    if @follow_request.valid?
      render json: { status: :accepted }
    else
      render json: { error: @follow_request.errors.full_messages.first}
    end
  end

  def confirm_follow_request
    @follow_request = FollowRequest.find(params[:id])
    @user = User.find(@follow_request.user_id)
    @follower = User.find(@follow_request.follower_id)
    # byebug
    if @follow_request.update(accepted: true)
      @user.followers << @follower
      @follower.followers << @user

      @follow_request.destroy

      render json: { status: :accepted }
    else
      render json: { error: @follow_request.errors.full_messages.first}
    end
  end



private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


  def update_username_params
    params.require(:attribute).permit(:username)
  end

  def update_first_name_params
    params.require(:attribute).permit(:first_name)
  end

  def update_last_name_params
    params.require(:attribute).permit(:last_name)
  end

  def update_email_params
    params.require(:attribute).permit(:email)
  end





end
