class Recipe < ApplicationRecord
  belongs_to :user
   has_many :comments, dependent: :destroy
   has_many :goods
   has_one_attached :image

   validates :image, presence: true
   validates :title, presence: true
   validates :body , presence: true

end
