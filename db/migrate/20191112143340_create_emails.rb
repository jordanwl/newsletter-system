class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.references :newsletter, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
