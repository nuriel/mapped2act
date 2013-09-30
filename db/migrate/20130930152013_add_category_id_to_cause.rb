class AddCategoryIdToCause < ActiveRecord::Migration
  def change
    add_column :causes, :cause_category_id, :integer
  end
end
