class AddQuestionToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :question, foreign_key: true, index: true
  end
end