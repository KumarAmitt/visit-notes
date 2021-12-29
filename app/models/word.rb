class Word < ApplicationRecord
  belongs_to :sub_goal

  validates :name, presence: true, uniqueness: { scope: :sub_goal_id }
end
