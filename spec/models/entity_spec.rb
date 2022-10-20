require 'rails_helper'

RSpec.describe 'entity', type: :model do
  subject = Entity.create(name: 'sanja', amount: 5)

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
    expect(Entity.search('tanja')).to eq []
  end

  it 'Search method return empty array' do
    expect(Entity.search('tanja')).to eq []
  end

  after(:context) { subject.destroy }
end
