require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest

test "should get me" do
  get profile_me_url
  assert_response 302
  follow_redirect!
  post '/users', params: {user: {nick: 'ivan_the_navi', name: 'Ivan', surname: 'Gorshkov', email: 'admin@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
  assert_response :redirect
  follow_redirect!
  assert_select 'body > div.page > div > div.column.right > div > p:nth-child(2)', 'Имя: Ivan'
  assert_select 'body > div.page > div > div.column.right > div > p:nth-child(3)', 'Фамилия: Gorshkov'
  assert_select 'body > div.page > div > div.column.right > div > p:nth-child(4)', 'Никнейм: ivan_the_navi'
  assert_select 'body > div.page > div > div.column.right > div > p:nth-child(5)', 'Почта: admin@dragonmaster.ru'
end

end
