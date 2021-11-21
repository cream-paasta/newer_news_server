class CreateGus < ActiveRecord::Migration[6.0]
  def change
    create_table :gus do |t|
      t.string :name
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
