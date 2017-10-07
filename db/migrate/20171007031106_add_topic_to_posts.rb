class AddTopicToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :topic_id, :string
    add_column :posts, :integer, :string
    add_index :posts, :integer
  end
end
