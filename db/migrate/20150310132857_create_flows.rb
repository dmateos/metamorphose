class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|

      t.timestamps null: false
    end
  end
end
