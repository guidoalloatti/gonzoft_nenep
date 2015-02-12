class AddVideoLinkToProduct < ActiveRecord::Migration
  def change
    add_column :products, :video_Link, :string
  end
end
