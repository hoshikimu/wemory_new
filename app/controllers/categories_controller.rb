class CategoriesController < ApplicationController
  def new
    @categories = Category.where(user_id: current_user.id)
    @new_category = Category.new
  end

  def create
    @new_category = Category.new(category_params)
    @new_category.user_id = current_user.id
    if @new_category.save
      flash[:success] = "カテゴリーを作成しました！"
      redirect_to new_category_path
    else
      @categories = Category.where(user_id: current_user.id)
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      flash[:success] = "カテゴリーを編集しました！"
      redirect_to new_category_path
    else
      @category = Category.find(params[:id])
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:success] = "カテゴリーを削除しました！"
      redirect_to new_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
