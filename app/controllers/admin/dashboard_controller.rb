class Admin::DashboardController < ApplicationController
  include HttpAuthConcern

  def show
    @data ||= {
      product_count: Product.sum(:quantity),
      category_count: Category.distinct.count
    }
    @categories ||= Category.all
  end

  def index
    @categories = Category.order(id: :desc).all
  end
end
