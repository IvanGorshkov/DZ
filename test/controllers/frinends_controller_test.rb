require 'test_helper'

class FrinendsControllerTest < ActionDispatch::IntegrationTest

  test "add friends" do
    post '/users', params: {user: {nick: 'ivan_the_navi', name: 'Ivan', surname: 'Gorshkov', email: 'admin@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
    assert_response :redirect
    follow_redirect!
    assert !session[:user_id].nil?
    get '/logout'
    post '/users', params: {user: {nick: 'ivan_the_navi2', name: 'Ivan2', surname: 'Gorshkov2', email: 'admin2@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
    assert_response :redirect
    follow_redirect!

    post '/add_friend', params: { add_friend: "980190963"}

    get '/view_friends'
    assert_equal [[["Ivan Gorshkov"],[980190963]]],assigns[:res]
  end

end
