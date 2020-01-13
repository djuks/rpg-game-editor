require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: "jon@example.com",
                         password: "password")
    @character = Character.create!(name:"Trol", user: @user)
  end

  test "should get index" do
    get characters_url
    assert_response :success
  end

  test "should get new" do
    get new_character_url
    assert_response :success
  end

  test "should create character" do
    sign_in @user
    assert_difference('Character.count') do
      post characters_url, params: { character: { name: @character.name } }
    end

    assert_redirected_to character_url(Character.last)
  end

  test "should show character" do
    get character_url(@character)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_url(@character)
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { name: @character.name } }
    assert_redirected_to character_url(@character)
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete character_url(@character)
    end

    assert_redirected_to characters_url
  end
end
