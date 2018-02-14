class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    @category = Category.new()
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Success"
    end
    redirect_to admin_categories_path
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
