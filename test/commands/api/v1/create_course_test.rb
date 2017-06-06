require 'test_helper'

class Api::V1::CreateCourseTest < ActiveSupport::TestCase
  test "success" do
    user = create(:user)
    command = Api::V1::CreateCourse.call(creator: user, title: 'test title', description: 'test description', price: 10)
    assert_equal command.result, Course.last
  end
end
