class ChangeCompletedDefaultOnTodoitems < ActiveRecord::Migration[7.1]
  def change
    change_column_default :todoitems, :completed, from: nil, to: false
  end
end
