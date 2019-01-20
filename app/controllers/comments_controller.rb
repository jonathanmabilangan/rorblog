class CommentsController < ApplicationController

  http_basic_authenticate_with name: "pong", password: "secret", only: :destroy

  def create
    @artice = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to artice_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to artice_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commented, :body)
    end
end
