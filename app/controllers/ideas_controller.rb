class IdeasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def show
    @idea = Idea.find(params[:id])
    @user = @idea.user
  end

  def new
    @categories = Category.all
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new()
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Success"
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    @user = @idea.user
    @categories = Category.all
  end

  def update
    @idea = Idea.find(params[:id])
    @user = @idea.user
    if @idea.update(idea_params)
      flash[:notice] = "Success"
      redirect_to user_idea_path(@user, @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @user = @idea.user
    @idea.destroy
    redirect_to user_ideas_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content, :category_id, :user)
  end
end
