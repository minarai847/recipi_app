class RecipesController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  def index
    @recipe = Recipe.order("created_at DESC")
    
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path

    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
      if @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
      else
        render :edit
      end
  end


  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comments = Comment.includes(:user).where(recipe_id: @recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
      recipe.destroy
      redirect_to root_path
  end



    private
    
    def recipe_params
      params.require(:recipe).permit(:title,:body,:material,:image).merge(user_id: current_user.id)
    end

    
end

