class CreateNumberOfParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :number_of_participants do |t|
      t.integer :number

      t.timestamps
    end
  end
end
