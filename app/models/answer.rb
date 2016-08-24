class Answer < ApplicationRecord
  validates :answer, presence: true
  validates :correct, inclusion: { in: [true, false] }

  belongs_to :question
end
