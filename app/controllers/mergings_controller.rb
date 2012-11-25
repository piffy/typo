class MergingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    c= @article.merge_with(params[:merge_with])
    if c.save
      flash[:notice] = "Articles merged."
    else
      flash[:notice] = "Unable to merge articles."
    end
    redirect_to  "/admin/content/"
  end

  def destroy
  end

end
