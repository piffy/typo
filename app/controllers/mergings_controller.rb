class MergingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    if @article.merge_with(params[:merge_article_id])
      flash[:notice] = "Articles merged."
    else
      flash[:notice] = "Unable to merge articles."
    end
    redirect_to  "/admin/content/edit/"+@article.id.to_s
  end

  def destroy
  end

end
