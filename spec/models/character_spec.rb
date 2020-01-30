require "rails_helper"

RSpec.describe Character, type: :model do
  context 'validation tests' do
    before(:each) do
      @registered_user = FactoryBot.create(:user,
                                            :email => "tester@testdomain.test",
                                            :username => "tester",
                                            :password => "pa$$word")
    end
    it 'ensures name presence' do
      character = @registered_user.characters.build(description: "test")
      expect(character.save).to eq(false)
    end

    it 'ensures name is uniqe' do
      character = @registered_user.characters.create!(name: "test", description: "test")
      character2 = @registered_user.characters.build(name: "test", description: "test")
      expect(character2.save).to eq(false)
    end

    it "ensure description presence" do
      character = @registered_user.characters.build(name: "test")
      expect(character.save).to eq(false)
    end
  end
end
