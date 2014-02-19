class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.text :description
      t.string :city

      t.timestamps
    end
  end
end
