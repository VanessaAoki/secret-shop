require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:votes) }
    it { should have_and_belong_to_many(:categories) }
  end

  describe 'Validations'
  it 'validates' do
    should validate_presence_of(:title)
    should validate_presence_of(:text)
  end
end
