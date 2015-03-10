class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.integer :connector_type
      t.string :parameters
      t.references :pipe
      t.timestamps null: false
    end
  end
end
