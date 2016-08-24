class Question < ApplicationRecord
  validates :category, :question, :points, presence: true
  has_many :answers, dependent: :destroy
end
