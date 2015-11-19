class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  validates :body, :track_id, :user_id, presence: true


end
