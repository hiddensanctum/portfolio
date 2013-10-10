class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :comment
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
