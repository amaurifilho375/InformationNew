class Tag < ApplicationRecord
  belongs_to :report
  belongs_to :video

end
