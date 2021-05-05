class AddTagToTodos < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :tag, foreign_key: true
  end
end
