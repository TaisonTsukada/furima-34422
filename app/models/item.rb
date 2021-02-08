class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_day
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :delivery_days_id, numericality: { other_than: 1 } 
  with_options presence: true, format: {with: /\A[0-9]+\z/, message: 'Price Half-width number'}, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
    validates :price
  end
  validates :image, presence: true
end
