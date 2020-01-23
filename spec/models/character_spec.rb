require "rails_helper"

RSpec.describe Character, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.create!(username: "test", email: "test@test.com",
                          password: "test123", password_confirmation: "test123")
      character = user.characters.build(description: "test")
      expect(character.save).to eq(false)
    end
    
    it "ensure description presence" do
      user = User.create!(username: "test", email: "test@test.com",
                          password: "test123", password_confirmation: "test123")
      character = user.characters.build(name: "test")
      expect(character.save).to eq(false)
    end
  end
end
