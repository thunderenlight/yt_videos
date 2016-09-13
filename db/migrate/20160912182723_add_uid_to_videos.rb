class AddUidToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :uid, :string
  end
end
