class AddPubedAtToIssue < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :pubed_at, :datetime
  end
end
