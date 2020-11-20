class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence:true do
          validates :name
            EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
           validates :email, format: {with: EMAIL}
          validates :password,format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers'}
          
         end
          has_many :recipes,dependent: :destroy
          has_many :goods
          has_many :comments,dependent: :destroy

          def already_gooded?(recipe)
            self.goods.exists?(recipe_id: recipe.id)
          end

 end
 
