class CreateActCauses < ActiveRecord::Migration
  def change
    create_table :act_causes do |t|
      t.integer :act_id
      t.integer :cause_id
      t.string :message
      t.string :url

      t.timestamps
    end
    add_index :act_causes, :act_id
    add_index :act_causes, :cause_id
  end
end
