class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  def mypage
  end


  def show
    @user = User.find(params[:id])
    @recipes =@user.recipes 
  end


  def edit 
    unless @user == current_user
          redirect_to user_path(@user)
         end
      end

  def update
   
    if current_user.update(user_params)
          redirect_to root_path
         else
          render :edit
         end
  end
 




  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    #ユーザーの名前とemailの情報を編集を許可している
    params.require(:user).permit(:name,:email)
  end

end