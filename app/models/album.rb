class Album < ActiveRecord::Base
  has_many :tracks, dependent: :destroy
  belongs_to :band
end
