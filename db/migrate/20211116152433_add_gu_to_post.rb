class AddGuToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :gu, :string
  end
end
