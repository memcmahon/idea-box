class IdeasController < ApplicationController
  layout "user_layout"

  def index
    @ideas = current_user.ideas
  end

  def show
    @idea = Idea.find(params[:id])
    @user = current_user
  end

  def new
    @categories = Category.all
    @images = Image.all
    @user = current_user
    @idea = @user.ideas.new()
  end

  def create
    @user = current_user
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      params[:idea][:image_ids].each do |id|
        @idea.idea_images.create(image_id: id.to_i)
      end
      flash[:notice] = "Success"
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    @user = current_user
    @categories = Category.all
    @images = Image.all
  end

  def update
    @idea = Idea.find(params[:id])
    @user = current_user
    if @idea.update(idea_params)
      @idea.idea_images.destroy_all
      params[:idea][:image_ids].each do |id|
        @idea.idea_images.create(image_id: id.to_i)
      end
      flash[:notice] = "Success"
      redirect_to user_idea_path(@user, @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @user = current_user
    @idea.destroy
    redirect_to user_ideas_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content, :category_id, :user, :image_ids)
  end
end
