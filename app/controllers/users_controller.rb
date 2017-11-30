class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
  	@users = User.all
  end

  def show
    @book = Book.new
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to edit_user_path(@user.id)
    end
  end

private
	def user_params
      params.require(:user).permit(:name, :image, :introduction)
	end
end
