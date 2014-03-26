class AddImageToChurches < ActiveRecord::Migration
  def change
    add_column :churches, :image, :string
  end
end
