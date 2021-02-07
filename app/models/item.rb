class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_days
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  valodates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :delivery_days_id, numericality: { other_than: 1 } 
  validates :price, presence: true
  validates :image, presence: true
end
