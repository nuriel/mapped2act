class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.integer :state
      t.string :name
      t.string :website
      t.string :phone
      t.string :email, :limit => 50
      t.text :social_contribution
      t.string :one_liner, :limit => 100
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :logo

      t.timestamps
    end
  end
end
