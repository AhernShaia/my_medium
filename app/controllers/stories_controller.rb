class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story, only: [:edit, :update, :show, :destroy]
  def index
    @stories = current_user.stories.order(update_at: :desc)
  end

  def new
    # @story = Story.new
    @story = current_user.stories.new
  end
  
  def create
    # @story = current.new(story_params)
    @story = current_user.stories.new(story_params)
    if @story.save
      redirect_to stories_path, notice: "#{@story.title}已新增"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to edit_story_path(@story), notice: "故事已更新"
      
    else
    end
  end

  def destroy
    if @story.update(deleted_at: Time.now)
      redirect_to stories_path, notice: "#{@story.title}已刪除"
    else
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :content)
  end

  def find_story
    @story = current_user.stories.find(params[:id])
  end
end
