class CreateSubTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_trackers do |t|
      t.integer :newsletter_id
      t.string :action

      t.timestamps
    end
  end
end
