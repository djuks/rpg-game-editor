require "rails_helper"

RSpec.describe Ability, type: :model do
  context 'validation tests' do
    before(:each) do
      @registered_user = FactoryBot.create(:user,
                                            :email => "tester@testdomain.test",
                                            :username => "tester",
                                            :password => "pa$$word")
      @character = FactoryBot.create(:character,
                                     :user => @registered_user,
                                     :name => "Ashe",
                                     :description => "My first Ashe")
    end
    it 'ensures name presence' do
      ability = @character.abilities.build(value: 5)
      expect(ability.save).to eq(false)
    end

    it 'ensures name is uniqe' do
      ability = @character.abilities.create!(name: "Power", value: 2)
      ability2 = @character.abilities.build(name: "Power", value: 5)
      expect(ability2.save).to eq(false)
    end

    it "ensure value presence" do
      ability = @character.abilities.build(name: "Power")
      expect(ability.save).to eq(false)
    end
  end
end
