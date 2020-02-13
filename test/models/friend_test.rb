require 'test_helper'

class FriendTest < ActiveSupport::TestCase
  test 'Add to DB' do
    (Friend.find_by id_user: '1').destroy unless (Friend.find_by id_user: '1').nil?
    Friend.create id_user: '1', id_friend: '2'
    assert_not_nil Friend.find_by id_user: '1'
    (Friend.find_by id_user: '2').destroy unless (Friend.find_by id_user: '2').nil?
    Friend.create id_user: '2', id_friend: '1'
    assert_equal Friend.where(id_friend: '1').first_or_create.id_user , Friend.where(id_user: '1').first_or_create.id_friend
  end

  test 'Different res from different value' do
    (Friend.find_by id_user: '1').destroy unless (Friend.find_by id_user: '1').nil?
    Friend.create id_user: '1', id_friend: '2'
    assert_not_nil Friend.find_by id_user: '1'
    (Friend.find_by id_user: '2').destroy unless (Friend.find_by id_user: '2').nil?
    Friend.create id_user: '2', id_friend: '1'
    assert_not_equal Friend.where(id_friend: '1').first_or_create.id_user,
                     Friend.where(id_friend: '2').first_or_create.id_user
  end
end
