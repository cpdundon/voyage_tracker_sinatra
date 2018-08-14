class AddInServiceColumnToBoats < ActiveRecord::Migration
  def change
		add_column :boats, :in_service, :boolean
  end
end
