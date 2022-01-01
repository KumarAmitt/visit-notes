class Goal < ApplicationRecord
  has_many :sub_goals, dependent: :destroy

  has_many :plan_of_cares
  has_many :patients, through: :plan_of_cares

  validates :title, presence: true, uniqueness: true

  scope :alphabetically, -> { order('title') }
  scope :ltg, -> { where(goal_type: 'LTG') }
  scope :stg, -> { where(goal_type: 'STG') }
end
