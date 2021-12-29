class SubGoal < ApplicationRecord
  belongs_to :goal
  has_many :words, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :goal_id }
end
