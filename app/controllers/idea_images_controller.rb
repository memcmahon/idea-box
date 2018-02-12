class IdeaImagesController < ApplicationController
  def create
    @idea_image = IdeaImage.new(idea_image_params)
    @idea = @idea_image.idea
    @user = @idea.user
    if @idea_image.save
      redirect_to user_idea_path(@user, @idea)
    else
      redirect_to user_idea_path(@user, @idea)
    end
  end

  def destroy
    @idea_image = IdeaImage.find(params[:id])
    @idea = @idea_image.idea
    @user = @idea.user
    if @idea_image.destroy
      redirect_to user_idea_path(@user, @idea)
    else
      redirect_to user_idea_path(@user, @idea)
    end
  end

  private

  def idea_image_params
    params.require(:idea_image).permit(:idea_id, :image_id)
  end
end
