class AddCommentsCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comments_counter, :integer, default: 0, null: false
  end
end
