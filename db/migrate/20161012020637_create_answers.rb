class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.boolean :yes
      t.string :cookie_key

      t.timestamps
    end
  end
end
