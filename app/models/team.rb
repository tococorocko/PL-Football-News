class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :crest, presence: true, uniqueness: true
end
