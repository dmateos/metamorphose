class CreatePipes < ActiveRecord::Migration
  def change
    create_table :pipes do |t|
      t.string :in
      t.string :out

      t.timestamps null: false
    end
  end
end
