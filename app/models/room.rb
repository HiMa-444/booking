class Room < ApplicationRecord
  validates :room_name, presence: true
  validates :room_detail, presence: true
  validates :room_much, presence: true, numericality: true
  validates :address, presence: true
  
  has_one_attached :room_image
end
