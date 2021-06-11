require 'rails_helper'

RSpec.describe Vote, type: :model do
  let!(:vote1) { Vote.new(user_id: 1, article_id: 1) }
  let!(:vote2) { Vote.new(user_id: 1, article_id: 1) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  describe 'Validations' do
    it 'Is valid.' do
      should validate_uniqueness_of(:user_id).scoped_to(:article_id)
    end

    it 'Must not be duplicated.' do
      vote1.save
      expect(vote2).to_not be_valid
    end
  end
end
