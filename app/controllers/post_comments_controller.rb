class PostCommentsController < ApplicationController
  def create
    @new_post_comment = PostComment.new(post_comment_params)
    @new_post_comment.user_id = current_user.id
    @new_post_comment.post_image_id = params[:post_image_id]
    if @new_post_comment.save
      flash[:success] = "コメントしました！"
      redirect_to post_images_path
    else
      flash[:alert] = "コメントに失敗しました。"
      redirect_to post_images_path
    end
  end

  def destroy
    post_comment = PostComment.find(:id)
    post_comment.destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
