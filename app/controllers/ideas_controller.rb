class IdeasController < ApplicationController
  layout "user_layout"

  def index
    if current_user.id.to_s == params[:user_id]
      @ideas = current_user.ideas
    else
      flash[:notice] = "Stick to your own ideas!"
      redirect_to user_path(current_user)
    end
  end

  def show
    if current_user.id.to_s == params[:user_id]
      @idea = Idea.find(params[:id])
    else
      flash[:notice] = "Stick to your own ideas!"
      redirect_to user_path(current_user)
    end
  end

  def new
    if current_user.id.to_s == params[:user_id]
      @categories = Category.all
      @images = Image.all
      @idea = current_user.ideas.new()
    else
      flash[:notice] = "Stick to your own ideas!"
      redirect_to user_path(current_user)
    end
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      params[:idea][:image_ids].each do |id|
        @idea.idea_images.create(image_id: id.to_i)
      end
      flash[:notice] = "Success"
      redirect_to user_idea_path(current_user, @idea)
    else
      render :new
    end
  end

  def edit
    if current_user.id.to_s == params[:user_id]
      @idea = Idea.find(params[:id])
      @categories = Category.all
      @images = Image.all
    else
      flash[:notice] = "Stick to your own ideas!"
      redirect_to user_path(current_user)
    end
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      @idea.idea_images.destroy_all
      params[:idea][:image_ids].each do |id|
        @idea.idea_images.create(image_id: id.to_i)
      end
      flash[:notice] = "Success"
      redirect_to user_idea_path(current_user, @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to user_ideas_path(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content, :category_id, :user, :image_ids)
  end
end
