require 'rails_helper'

RSpec.describe ArticlesCategory, type: :model do
  describe 'Associations ' do
    should belong_to(:article)
    should belong_to(:category)
  end
end
