class CreateCauseCategories < ActiveRecord::Migration
  def change
    create_table :cause_categories do |t|
      t.string :name
      t.text :description
      t.string :marker_address

      t.timestamps
    end
  end
end
