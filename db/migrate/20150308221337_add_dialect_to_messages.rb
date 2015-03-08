class AddDialectToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :dialect, :string
  end
end
