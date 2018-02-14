class Admin::ImagesController < Admin::BaseController
  before_action :set_image, only: [:edit, :update, :destroy]

  def index
    @images = Image.all
    @image = Image.new()
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Success"
      redirect_to admin_images_path
    end
  end

  def edit
  end

  def update
    @image.update(image_params)
    redirect_to admin_images_path
  end

  def destroy
    @image.destroy
    redirect_to admin_images_path
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:url, :alt_tag)
    end
end
