class RemoveAnswersfromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :answer, :string
  end
end
