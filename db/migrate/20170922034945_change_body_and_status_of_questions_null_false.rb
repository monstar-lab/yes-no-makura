class ChangeBodyAndStatusOfQuestionsNullFalse < ActiveRecord::Migration[5.0]
  def change
    change_column_null :questions, :body,  false
    change_column_null :questions, :state, false
  end
end
