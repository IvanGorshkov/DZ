require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  test 'Add to DB' do
    (News.find_by user: '1').destroy unless (News.find_by user: '1').nil?
    News.create user: '1', post: 'Это пост для проверки'
    assert_not_nil News.find_by user: '1'
    assert_equal 'Это пост для проверки', News.where(user: '1').first_or_create.post
  end

  test 'Different res from different value' do
    (News.find_by user: '1').destroy unless (News.find_by user: '1').nil?
      News.create user: '1', post: 'Это пост для проверки'
    (News.find_by user: '2').destroy unless (News.find_by user: '2').nil?
    News.create user: '2', post: 'Другой пост для проверки'
    assert_not_equal News.where(user: '1').first_or_create.post,
                     News.where(user: '2').first_or_create.post
  end
  test 'dont save with nil post' do
    assert News.create(user: '2', post: nil).invalid?
  end
end
