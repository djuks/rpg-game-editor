require "rails_helper"

RSpec.describe Ability, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.create!(username: "test", email: "test@test.com",
                          password: "test123", password_confirmation: "test123")
      character = user.characters.build(name: "test", description: "test")
      character.save
      ability = character.abilities.build(value: 5)
      expect(ability.save).to eq(false)
    end

    it "ensure value presence" do
      user = User.create!(username: "test", email: "test@test.com",
                          password: "test123", password_confirmation: "test123")
      character = user.characters.build(name: "test", description: "test")
      character.save
      ability = character.abilities.build(name: "Power")
      expect(ability.save).to eq(false)
    end
  end
end
