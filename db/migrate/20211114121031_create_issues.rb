class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :original_link, uniq: true
      t.string :link, uniq: true
      t.integer :view_count, default: 0, null: false
      t.text :description

      t.timestamps
    end
  end
end
