class AddAgentIdToAdspotsTable < ActiveRecord::Migration
  def change
    add_column :adspots, :agent_id, :integer
    add_index :adspots, :zipcode
  end
end
