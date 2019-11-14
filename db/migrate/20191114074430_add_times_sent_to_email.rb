class AddTimesSentToEmail < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :times_sent, :integer, default: 0
  end
end
