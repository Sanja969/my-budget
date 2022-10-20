require 'rails_helper'

RSpec.describe 'groups', type: :model do
  subject = Group.create(name: 'sanja', image_data: '{"id":"75a66e471ff934c9be8d1656c8ba42bc.jpeg","storage":"store","metadata":{"filename":"STL136320.jpeg","size":166852,"mime_type":"image/jpeg"}}')

  it 'Name should be present' do
    expect(subject.name).present?
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Search method return empty array' do
    expect(Group.search('tanja')).to eq []
  end

  after(:context) { subject.destroy }
end
