require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

test "should get new" do
  post '/users', params: {user: {nick: 'ivan_the_navi', name: 'Ivan', surname: 'Gorshkov', email: 'admin@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
  assert_response :redirect
  follow_redirect!
  assert !session[:user_id].nil?
end

end
