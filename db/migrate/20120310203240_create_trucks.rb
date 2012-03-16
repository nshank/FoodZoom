class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :website
      t.string :twitter_name
      t.text :info

      t.timestamps
    end
  end
end
