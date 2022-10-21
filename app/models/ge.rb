class Ge < ApplicationRecord
  belongs_to :entity, foreign_key: 'entity_id'
  belongs_to :group, foreign_key: 'group_id'
end
