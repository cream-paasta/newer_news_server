class CreateIssuesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :issues_users do |t|
      t.belongs_to :user
      t.belongs_to :issue
      t.integer :kind

      t.timestamps
    end
  end
end
