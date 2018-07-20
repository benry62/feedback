require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { area_for_development: @comment.area_for_development, date: @comment.date, dirt: @comment.dirt, grade: @comment.grade, spelling: @comment.spelling, student_id: @comment.student_id, title: @comment.title, www: @comment.www } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { area_for_development: @comment.area_for_development, date: @comment.date, dirt: @comment.dirt, grade: @comment.grade, spelling: @comment.spelling, student_id: @comment.student_id, title: @comment.title, www: @comment.www } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
