class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.text :name
      t.text :description
      t.text :company
      t.text :city
      t.integer :phone
      t.text :website

      t.timestamps
    end
  end
end
