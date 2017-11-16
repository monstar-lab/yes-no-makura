class AddDefaultOfState < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :state, :string, default: "init"
  end

  def down
    change_column :questions, :state, :string
  end
end
