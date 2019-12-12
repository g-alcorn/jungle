class Admin::DashboardController < ApplicationController
  include HttpAuthConcern

  def show
    @data ||= {
      product_count: Product.sum(:quantity),
      category_count: Category.distinct.count}
  end
end
