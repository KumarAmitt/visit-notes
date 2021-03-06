class Patient < ApplicationRecord
  has_many :plan_of_cares
  has_many :goals, through: :plan_of_cares

  has_many :comments
  has_many :sub_goals, through: :comments

  has_many :pronunciations
  has_many :words, through: :pronunciations
end
