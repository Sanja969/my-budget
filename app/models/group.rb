class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :ges, dependent: :destroy, foreign_key: 'group_id'

  include ImageUploader::Attachment(:image)
  validates :name, presence: true, length: { maximum: 250 }

  def self.search(search)
    if search
      group = Group.where(name: search)
      group || Group.all
    else
      Group.all
    end
  end

  def total
    sum = 0
    ges.each do |item|
      sum += Entity.find(item.entity_id).amount
    end
    sum
  end
end
