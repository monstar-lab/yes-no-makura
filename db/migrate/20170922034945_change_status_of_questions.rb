class ChangeStatusOfQuestions < ActiveRecord::Migration[5.0]
  def up
    change_column_null :questions, :body, false
    change_column_null :questions, :state, false
  end

  def down
    change_column_null :questions, :body, true
    change_column_null :questions, :state, true
  end
end
