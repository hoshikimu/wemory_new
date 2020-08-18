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
    new_approval.approvered_id = params[:user]
    if new_approval.save
      redirect_to top_path
    else
      new_approval = Approval.new
      new_approval.approver_id = current_user.approver_id
      new_approval.approvered_id = params[:user_id]
      render :create
    end
  end

  # private
  # def approval_params
  #   params.require(:approval).permit(:permission_status)
  # end
end
