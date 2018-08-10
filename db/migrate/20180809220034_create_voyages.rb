class CreateVoyages < ActiveRecord::Migration
  def change
    create_table :voyages do |t|
			t.integer :skipper_id
			t.integer :boat_id
			t.datetime	:start_time
			t.datetime	:end_time
			t.text	:crew
      t.text	:initial_condition
			t.text	:return_condition
			t.timestamps null: false
    end
  end
end
