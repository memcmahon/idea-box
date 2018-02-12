class ImagesController < ApplicationController
  def index
    @images = Image.all
    @image = Image.new()
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Success"
      redirect_to images_path
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find[:id]
    @image.update(image_params)
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:url, :alt_tag)
  end
end
