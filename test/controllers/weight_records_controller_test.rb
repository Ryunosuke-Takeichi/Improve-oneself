require 'test_helper'

class WeightRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weight_record = weight_records(:one)
  end

  test "should get index" do
    get weight_records_url
    assert_response :success
  end

  test "should get new" do
    get new_weight_record_url
    assert_response :success
  end

  test "should create weight_record" do
    assert_difference('WeightRecord.count') do
      post weight_records_url, params: { weight_record: { start_weight: @weight_record.start_weight, user_id: @weight_record.user_id, weight: @weight_record.weight } }
    end

    assert_redirected_to weight_record_url(WeightRecord.last)
  end

  test "should show weight_record" do
    get weight_record_url(@weight_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_weight_record_url(@weight_record)
    assert_response :success
  end

  test "should update weight_record" do
    patch weight_record_url(@weight_record), params: { weight_record: { start_weight: @weight_record.start_weight, user_id: @weight_record.user_id, weight: @weight_record.weight } }
    assert_redirected_to weight_record_url(@weight_record)
  end

  test "should destroy weight_record" do
    assert_difference('WeightRecord.count', -1) do
      delete weight_record_url(@weight_record)
    end

    assert_redirected_to weight_records_url
  end
end
