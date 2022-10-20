class Entity < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :ges, dependent: :destroy, foreign_key: 'entity_id'

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.search(search)
    if search
      entity = self.where(name: search)
      entity || ges
    else
      Entity.all
    end
  end
end