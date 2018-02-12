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
end
