class CreatePipes < ActiveRecord::Migration
  def change
    create_table :pipes do |t|
      t.integer :in_type
      t.integer :out_type
      t.timestamps null: false
    end
  end
end
