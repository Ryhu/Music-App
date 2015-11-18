class Band < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums
end
