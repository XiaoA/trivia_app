class Question < ApplicationRecord
  validates :category, :question, :points, presence: true
end
