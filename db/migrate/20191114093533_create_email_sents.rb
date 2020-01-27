class CreateEmailSents < ActiveRecord::Migration[6.0]
  def change
    create_table :email_sents do |t|
      t.boolean :custom_email
      t.references :user, foreign_key: true
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
