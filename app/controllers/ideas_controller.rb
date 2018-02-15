class IdeasController < ApplicationController
  before_action :verify_user
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  layout "user_layout"

  def index
    @ideas = current_user.ideas
  end

  def show
  end

  def new
    @categories = Category.all
    @images = Image.all
    @idea = current_user.ideas.new()
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
    @categories = Category.all
    @images = Image.all
  end

  def update
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
    current_user.ideas.destroy(params[:id])
    redirect_to user_ideas_path(current_user)
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def verify_user
      unless current_user.id.to_s == params[:user_id]
        flash[:notice] = "Stick to your own ideas!"
        redirect_to user_path(current_user)
      end
    end

    def idea_params
      params.require(:idea).permit(:title, :content, :category_id, :user, :image_ids)
    end
end
