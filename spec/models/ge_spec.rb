require 'rails_helper'

RSpec.describe 'entity', type: :model do
  group = Group.create(name: 'sanja', image_data: '{"id":"75a66e471ff934c9be8d1656c8ba42bc.jpeg","storage":"store","metadata":{"filename":"STL136320.jpeg","size":166852,"mime_type":"image/jpeg"}}')
  entity = Entity.create(name: 'sanja', amount: 5)
  subject = Ge.create(group: group, entity: entity)

  it 'is not valid without a name' do
    expect(group.total).to eq 0
  end

  after(:context) { subject.destroy }
end
