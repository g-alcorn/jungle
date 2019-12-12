class Admin::CategoriesController < ApplicationController
  include HttpAuthConcern

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def new
    @category = Category.new
    if @category
      render :new
    else
      render :dashboard
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_root_url, notice: 'Category created'
    else
      render :dashboard
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
