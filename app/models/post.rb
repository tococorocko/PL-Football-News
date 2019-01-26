class Post < ApplicationRecord
  belongs_to :team

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :link, presence: true
end
