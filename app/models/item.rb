class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_day
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_day_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' },
               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
    validates :price
  end
end
