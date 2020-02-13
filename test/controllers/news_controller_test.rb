require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest

  test "should add posts" do
    post '/users', params: {user: {nick: 'ivan_the_navi', name: 'Ivan', surname: 'Gorshkov', email: 'admin@dragonmaster.ru',  password: '111',  password_confirmation: '111'}}
    follow_redirect!
    assert_response :success
    post '/post_add', params: { post: 'Текст поста' }
    assert News.find_by_post('Текст поста')
  end

end
