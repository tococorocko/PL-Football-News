class Team < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates :crest, presence: true, uniqueness: true

  default_scope -> { order(name: :asc) }

end
