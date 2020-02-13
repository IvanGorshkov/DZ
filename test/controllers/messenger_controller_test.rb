require 'test_helper'

class MessengerControllerTest < ActionDispatch::IntegrationTest
test 'test send and get mes' do

    post '/users', params: {user: {nick: 'ivan_the_navi', name: 'Ivan', surname: 'Gorshkov', email: 'admin@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
    assert_response :redirect
    follow_redirect!
    assert !session[:user_id].nil?
    get '/logout'
    post '/users', params: {user: {nick: 'ivan_the_navi2', name: 'Ivan2', surname: 'Gorshkov2', email: 'admin2@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
    assert_response :redirect
    follow_redirect!

    post '/add_friend', params: { add_friend: "980190963"}
    get '/send', params: {mes: "Тест", id_friend: "980190963"}

    get '/messenger'
    assert_equal [[["Ivan Gorshkov"],["Тест"],[980190963]]],assigns[:dial]
  end
end
