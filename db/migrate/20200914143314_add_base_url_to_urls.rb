class AddBaseUrlToUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :base_url, :string
  end
end
