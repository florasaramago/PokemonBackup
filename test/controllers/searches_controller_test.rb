require "test_helper"

class BackupsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    get new_search_url
    assert_response :ok
    assert_select "form"
  end

  test "show with results" do
    get search_url, params: { key: "name", value: "Energy" }
    assert_response :ok
    assert_select "div", text: /We found 1 cards with name containing 'Energy'./
    assert_select "img", count: 1
  end

  test "show without results" do
    get search_url, params: { key: "name", value: "hello" }
    assert_response :ok
    assert_select "div", text: /No cards found with name containing 'hello'./
  end
end
