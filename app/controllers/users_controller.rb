class UsersController < ApplicationController

  def show
    # userの定義
    # プロフィール画像に対してActiveStorageによるhas_one_attachedの指定はprofile_imageとしてください。
    @user = User.find(params[:id])
    # bookの定義
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
   if @user == current_user
     render :edit
   else
     redirect_to user_path(current_user.id)
   end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
   if @user.save
    # サクセスメッセージ
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
   else
    render :edit
   end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end



  private

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end
end