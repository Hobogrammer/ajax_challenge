class CreateAdspots < ActiveRecord::Migration
  def change
    create_table :adspots do |t|
      t.integer :zipcode
      t.date :month

      t.timestamps
    end
  end
end
