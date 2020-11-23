class Recipe < ApplicationRecord
  belongs_to :user
   has_many :comments, dependent: :destroy
   has_many :goods, dependent: :destroy
   has_one_attached :image
   has_many :replies, class_name:'Comment', foreign_key: :reply_comment, dependent: :destroy

   validates :image, presence: true
   validates :title, presence: true
   validates :body , presence: true
   validates :material, presence: true

end
