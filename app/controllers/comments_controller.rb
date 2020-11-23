class CommentsController < ApplicationController
  
  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to "/recipes/#{@comment.recipe.id}"
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/recipes/#{@comment.recipe.id}"
    else
      @recipe = @comment.recipe
      @comments = @recipe.comments
      render "recipes/show"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text,:reply_comment).merge(user_id:current_user.id,recipe_id: params[:recipe_id])
  end

end
