class RecipeController < ApplicationController
  def index
  end

  def new
  end

  def create
  end
  

  private

  def recipe_params
    params.require(:recipe).permit(:body,:title, :image).merge(user_id: current_user.id)
  end
end
