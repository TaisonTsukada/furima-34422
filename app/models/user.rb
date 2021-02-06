class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: ' Full-width characters' } do
    validates :family_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: 'Full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z{6,}/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
