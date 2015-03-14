class CreateEndpoints < ActiveRecord::Migration
  def change
    create_table :endpoints do |t|
      t.references :flow
      t.string :data
      t.timestamps null: false
    end
  end
end
