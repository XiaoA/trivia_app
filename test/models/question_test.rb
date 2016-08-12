require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup 
    @question = Question.new(category: "history", question: "In what year did World War 2 End?", answer: "1945", points: 1)
  end

  test "valid question" do
    assert @question.valid?
  end

  test "question without category are invalid" do
    @question.category = nil
    assert_not @question.valid?
  end

  test "empty questions are invalid" do
    @question.question = nil
    assert_not @question.valid?
  end

  test "questions without an answer are invalid" do
    @question.answer = nil
    assert_not @question.valid?
  end

  test "questions without a point value are invalid" do
    @question.points = nil
    assert_not @question.valid?
  end
end
