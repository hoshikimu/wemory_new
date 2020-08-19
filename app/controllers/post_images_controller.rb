class PostImagesController < ApplicationController

def new
  @new_post_image = PostImage.new
  @categories = Category.where(user_id: current_user.id)
end

def create
  @new_post_image = PostImage.new(post_image_params)
  @new_post_image.user_id = current_user.id
  if @new_post_image.save
    redirect_to post_images_path
  else
    @new_post_image = PostImage.new
    @categories = Category.all
    render :new
  end
end

def index
  @categories = Category.where(user_id: current_user.id)
  @post_images = PostImage.where(user_id: current_user.id)
end

def show
  @post_image = PostImage.find(params[:id])
  @introduction = @post_image.introduction
end

private
def post_image_params
  params.require(:post_image).permit(:user_id, :category_id, :introduction, :image)
end

end