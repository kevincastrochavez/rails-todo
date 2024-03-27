class CreateTodoitems < ActiveRecord::Migration[7.1]
  def change
    create_table :todoitems do |t|
      t.string :name
      t.text :description
      t.datetime :deadline
      t.boolean :completed

      t.timestamps
    end
  end
end
