class SubGoal < ApplicationRecord
  belongs_to :goal
  has_many :words, dependent: :destroy

  has_many :comments
  has_many :patients, through: :comments

  validates :title, presence: true, uniqueness: { scope: :goal_id }
end
