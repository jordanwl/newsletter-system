class AddNameToNewsletters < ActiveRecord::Migration[6.0]
  def change
    add_column :newsletters, :name, :string
  end
end
