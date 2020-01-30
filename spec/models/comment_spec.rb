require "rails_helper"

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    it 'ensures description presence' do
      @registered_user = FactoryBot.create(:user,
                                            :email => "tester@testdomain.test",
                                            :username => "tester",
                                            :password => "pa$$word")
      @character = FactoryBot.create(:character,
                        :user => @registered_user,
                        :name => "Ashe",
                        :description => "My first Ashe")
      comment = @character.comments.build()
      expect(comment.save).to eq(false)
    end

    it "ensure comment length is not less then 1 character" do
      @registered_user = FactoryBot.create(:user,
                                            :email => "tester@testdomain.test",
                                            :username => "tester",
                                            :password => "pa$$word")
      @character = FactoryBot.create(:character,
                        :user => @registered_user,
                        :name => "Ashe",
                        :description => "My first Ashe")

      comment = @character.comments.build(description: "")
      expect(comment.save).to eq(false)
    end

    it "ensure comment length is not greater then 100 character" do
      @registered_user = FactoryBot.create(:user,
                                            :email => "tester@testdomain.test",
                                            :username => "tester",
                                            :password => "pa$$word")
      @character = FactoryBot.create(:character,
                        :user => @registered_user,
                        :name => "Ashe",
                        :description => "My first Ashe")
      description = "a" * 101
      comment = @character.comments.build(description: description)
      expect(comment.save).to eq(false)
    end
  end
end
