class CreatePipes < ActiveRecord::Migration
  def change
    create_table :pipes do |t|
      t.integer :in
      t.integer :out
      t.integer :in_type
      t.integer :out_type
      t.string :in_options

      t.timestamps null: false
    end
  end
end
