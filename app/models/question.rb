class Question < ApplicationRecord
  validates :category, :question, :answer, :points, presence: true
end
