class Pronunciation < ApplicationRecord
  belongs_to :patient
  belongs_to :word
end
