class ApprovalsController < ApplicationController
  def search
  end

  def permission
    @user = User.find_by(name: params[:name], email: params[:email])
    @new_approval = Approval.new
  end

  def create
    new_approval = Approval.new
    new_approval.permission_status = params[:permission_status]
    new_approval.approver_id = current_user.id
    new_approval.approvered_id = params[:user_id]
    if new_approval.save!
      redirect_to top_path
    else
      render :search
    end
  end

  def index
    @user_selected = params[:selected]
    @approvers = Approval.where(approver_id: current_user.id)
    @approvereds = Approval.where(approvered_id: current_user.id)
  end

  def post_image_index
    @approver_user_id = params[:approver_id]
    @categories = Category.where(user_id: @approver_user_id)
    @post_images = PostImage.where(user_id: @approver_user_id)
  end

  def post_image_index_by_category
    @approver_user_id = params[:approver_id]
    @categories = Category.where(user_id: @approver_user_id)
    @post_images = PostImage.where(user_id: @approver_user_id, category_id: params[:category_id])
  end

end
