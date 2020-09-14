class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short
      t.string :complete_short
      t.integer :click_count, :default => 0

      t.timestamps
    end
  end
end
