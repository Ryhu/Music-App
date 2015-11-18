class Album < ActiveRecord::Base
  validates :title, :album_type, :band_id, :year, presence: true
  has_many :tracks, dependent: :destroy
  belongs_to :band
end
