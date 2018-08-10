class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
			t.integer :number
			t.string	:name
			t.string	:manufacturer
			t.string	:model
			t.integer	:year
      t.timestamps null: false
    end
  end
end
