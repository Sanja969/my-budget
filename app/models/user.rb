class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities, dependent: :destroy, foreign_key: 'user_id'
  has_many :groups, dependent: :destroy, foreign_key: 'user_id'
end
