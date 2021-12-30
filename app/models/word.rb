class Word < ApplicationRecord
  belongs_to :sub_goal

  has_many :pronunciations
  has_many :patients, through: :pronunciations

  validates :name, presence: true, uniqueness: { scope: :sub_goal_id }
end
