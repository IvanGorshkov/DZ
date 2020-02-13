require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'Add to DB' do
    (Message.find_by user1: '1').destroy unless (Message.find_by user1: '1').nil?
    Message.create user1: '1', user2: '2', who_wrote: '1',  message: 'Это сообщение для проверки'

    assert_not_nil Message.find_by user1: '1'
    assert_equal 'Это сообщение для проверки', Message.where(user1: '1').first_or_create.message
  end
  test 'Different res from different value' do
    (Message.find_by user1: '1').destroy unless (Message.find_by user1: '1').nil?
    Message.create user1: '1', user2: '2', who_wrote: '1',  message: 'Это сообщение1 для проверки'
    (Message.find_by user1: '2').destroy unless (Message.find_by user1: '2').nil?
    Message.create user1: '2', user2: '1', who_wrote: '2',  message: 'Это сообщение2 для проверки'
    assert_not_equal Message.where(user1: '1').first_or_create.message,
                     Message.where(user1: '2').first_or_create.message
  end
  test 'dont save with nil mes' do
    assert Message.create(user1: '2', user2: '1', who_wrote: '2',  message: nil).invalid?

  end
end
