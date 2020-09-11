require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build_stubbed(:user) }

    it 'is valid by default' do
      expect(user.valid?).to be(true)
    end

    it 'requires an email' do
      user.email = nil
      expect(user.valid?).to be(false)
      expect(user.errors[:email]).not_to be_empty
    end
  end
end
