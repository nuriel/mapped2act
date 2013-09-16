class AddGmapsToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :gmaps, :boolean
  end
end
