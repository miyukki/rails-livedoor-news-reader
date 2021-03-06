class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def show
  end

  private

  def set_article
    @article = Article.find_by(id: params[:id])
    redirect_to root_path if @article.blank?
  end
end
