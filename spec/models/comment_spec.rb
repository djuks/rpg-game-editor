require "rails_helper"

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    it 'ensures description presence' do
      user = User.create!(username: "test", email: "test@test.com",
                          password: "test123", password_confirmation: "test123")
      character = user.characters.build(name: "test", description: "test")
      comment = character.comments.build()
      expect(comment.save).to eq(false)
    end

    it "ensure comment length is not less then 1 character" do
      user = User.create!(username: "test", email: "test@test.com",
                          password: "test123", password_confirmation: "test123")
      character = user.characters.build(name: "test", description: "test")
      description = ""
      comment = character.comments.build(description: description)
      expect(comment.save).to eq(false)
    end

    it "ensure comment length is not greater then 100 character" do
      user = User.create!(username: "test", email: "test@test.com",
                          password: "test123", password_confirmation: "test123")
      character = user.characters.build(name: "test", description: "test")
      description = "a" * 101
      comment = character.comments.build(description: description)
      expect(comment.save).to eq(false)
    end
  end
end
