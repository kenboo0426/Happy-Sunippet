class AddPostsUseridForeignkey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key "posts", "users", on_delete: :cascade
  end
end
