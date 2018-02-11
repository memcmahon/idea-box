class IdeasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def show
    @idea = Idea.find(params[:id])
  end
end
