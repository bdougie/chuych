class AddChurchToPost < ActiveRecord::Migration
  def change
    add_column :posts, :church_id, :integer
  end
end
