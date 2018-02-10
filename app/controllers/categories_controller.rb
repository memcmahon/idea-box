class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new()
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Success"
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
