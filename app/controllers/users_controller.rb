class UsersController < ApplicationController

  def show
  end
  

  def edit 
  end

  def update
   
    if current_user.update(user_params)
      redirect_to root_path
      
    else
      render :edit
    end
  end
 

def delete
  
end


  private

  def user_params
    #ユーザーの名前とemailの情報を編集を許可している
    params.require(:user).permit(:name, :email)
  end

end