class Track < ActiveRecord::Base
  validates :lyrics, :track_type, :album_id, :track_length, :track_name, presence: true
  belongs_to :album
  has_many :notes
end
