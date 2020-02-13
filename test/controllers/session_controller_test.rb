require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest

test "should get login" do
  post '/users', params: {user: {nick: 'ivan_the_navi', name: 'Ivan', surname: 'Gorshkov', email: 'admin@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
  assert_response :redirect
  follow_redirect!
  assert !session[:user_id].nil?
  get '/logout'
  assert_redirected_to '/login'
  post '/login', params: { nick: 'ivan_the_navi', password: '111' }
  assert !session[:user_id].nil?

end
test 'dont have user' do
  post '/login', params: { email: 'ivan@admin.ru', password: '123' }
  assert session[:user_id].nil?
end
end
