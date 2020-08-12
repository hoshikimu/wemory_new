class PostImagesController < ApplicationController

def new
  @new_post_image = PostImage.new
  @categories = Category.all
end

def create
  
end

def index
  
end

private
def post_image_params
  params.require(:post_image).permit(:user_id, :category_id, :introduction)
end

end