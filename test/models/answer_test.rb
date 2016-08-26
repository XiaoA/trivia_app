require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @question = Question.create!(category: 'history',
                                 question: 'In what year did World War 2 End?',
                                 points: 1)
    @answer = Answer.new(answer: '1945', correct: true, question_id: @question.id)
  end

  test 'valid answer' do
    assert @answer.valid?
  end

  test 'blank answers are invalid' do
    @answer = Answer.new(answer: ' ', correct: false)
    assert_not @answer.valid?
  end

  test 'answers must be either true or false' do
    @answer = Answer.new(answer: '1945', correct: nil)
    assert_not @answer.valid?
  end
end
