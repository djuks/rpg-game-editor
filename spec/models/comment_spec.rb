require "rails_helper"

RSpec.describe Comment, type: :model do
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
    it 'ensures description presence' do
      comment = @character.comments.build(description: "")
      expect(comment.save).to eq(false)
    end

    it "ensure comment length is not less then 3 character" do
      description = "a" * 2
      comment = @character.comments.build(description: description)
      expect(comment.save).to eq(false)
    end

    it "ensure comment length is not greater then 100 character" do
      description = "a" * 101
      comment = @character.comments.build(description: description)
      expect(comment.save).to eq(false)
    end
  end
end
