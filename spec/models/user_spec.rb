require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(id: 1, name: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }

  describe 'Associations ' do
    it { should have_many(:articles).with_foreign_key(:author_id).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
  end

  describe 'Validations'
  it 'Is valid with name.' do
    expect(user).to be_valid
  end

  it 'Name must be 20 characters or less.' do
    user.name = 'Vanessa Sakamoto Aoki da Silva'
    expect(user).to_not be_valid
  end

  it 'Name must be present.' do
    user.name = nil
    expect(user).to_not be_valid
  end
end
