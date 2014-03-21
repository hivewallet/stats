class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :tag
      t.integer :download_count
      t.text :raw

      t.timestamps
    end
  end
end
