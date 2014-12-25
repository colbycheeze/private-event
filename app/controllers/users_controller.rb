class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User #{@user.name} created."
      log_in @user
      redirect_to @user
    else
      flash.now[:error] = "Oops! Something went wrong."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.paginate(page: params[:page], per_page: 10)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
