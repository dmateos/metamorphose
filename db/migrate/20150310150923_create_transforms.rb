class CreateTransforms < ActiveRecord::Migration
  def change
    create_table :transforms do |t|
      t.references :pipe
      t.integer :transform_type
      t.string :parameters
      t.timestamps null: false
    end
  end
end
