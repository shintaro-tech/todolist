class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :content
      t.string :title
      t.references :user, foreign_key: true
      #t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
