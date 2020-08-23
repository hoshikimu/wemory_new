class PostImagesController < ApplicationController
  before_action :ensure_correct_user?, only: :show

  def ensure_correct_user?
    post_image_user_id = PostImage.find(params[:id]).user_id
    if post_image_user_id != current_user.id
      redirect_to top_path
      flash[:alert] = "閲覧権限がありません。"
    end
  end

  def new
    @new_post_image = PostImage.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @new_post_image = PostImage.new(post_image_params)
    @new_post_image.user_id = current_user.id
    if @new_post_image.save
      flash[:success] = "写真を投稿しました！"
      redirect_to post_images_path
    else
      @categories = Category.where(user_id: current_user.id)
      render :new
    end
  end

  def index
    @categories = Category.where(user_id: current_user.id)
    @post_images = PostImage.where(user_id: current_user.id)
  end

  def index_by_category
    @categories = Category.where(user_id: current_user.id)
    @post_images = PostImage.where(user_id: current_user.id, category_id: params[:category_id])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @introduction = @post_image.introduction
    @permission_status = Approval.find_by(approver_id: @post_image.user_id, approvered_id: current_user.id, permission_status: "閲覧者(アルバム注文可)")
  end

  def edit
    @post_image = PostImage.find(params[:id])
    @categories = Category.where(user_id: current_user.id)
  end

  def update
    post_image = PostImage.find(params[:id])
    if post_image.update(post_image_params)
      flash[:success] = "投稿を編集しました！"
      redirect_to post_images_path
    else
      @post_image = PostImage.find(params[:id])
      render :edit
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    if post_image.destroy
      flash[:success] = "写真を削除しました！"
      redirect_to post_images_path
    end
  end

  private
  def post_image_params
    params.require(:post_image).permit(:user_id, :category_id, :introduction, :image)
  end

end