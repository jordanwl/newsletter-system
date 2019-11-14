class CreateEmailSents < ActiveRecord::Migration[6.0]
  def change
    create_table :email_sents do |t|
      t.integer :user_id
      t.integer :email_id
      t.boolean :custom_email

      t.timestamps
    end
  end
end
