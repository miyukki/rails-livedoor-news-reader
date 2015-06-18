class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def index
    @categories = Category.all
  end

  def show
    @articles = @category.articles.recent.limit(30)
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
    redirect_to root_path if @category.blank?
  end
end
