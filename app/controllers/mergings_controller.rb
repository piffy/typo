class MergingsController < ApplicationController
  def create
    @article = Article.find(params[:merge_with])
    c= @article.merge_with(params[:article_id])

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
