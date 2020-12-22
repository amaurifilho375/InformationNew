class Comment < ApplicationRecord
  belongs_to :report
  belongs_to :user

 # validates :comment, presence: true
 # validates :rating, presence: true
 

end
