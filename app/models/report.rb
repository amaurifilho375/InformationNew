class Report < ApplicationRecord
   has_many :tags
   has_many :comments
   belongs_to :user

  validates :titulo, presence: true
  validates :rated, presence: true
  validates :rating, presence: true
  #validates :rating, presence: true

end
