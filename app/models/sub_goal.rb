class SubGoal < ApplicationRecord
  belongs_to :goal
  has_many :words, dependent: :destroy
end
