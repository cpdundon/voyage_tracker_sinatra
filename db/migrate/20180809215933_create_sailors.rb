class CreateSailors < ActiveRecord::Migration
  def change
    create_table :sailors do |t|
			t.string :username
			t.string :email
			t.string :password_digest
			t.boolean :skipper
      t.timestamps null: false
    end
  end
end
