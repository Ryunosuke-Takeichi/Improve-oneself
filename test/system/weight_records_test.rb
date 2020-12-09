require "application_system_test_case"

class WeightRecordsTest < ApplicationSystemTestCase
  setup do
    @weight_record = weight_records(:one)
  end

  test "visiting the index" do
    visit weight_records_url
    assert_selector "h1", text: "Weight Records"
  end

  test "creating a Weight record" do
    visit weight_records_url
    click_on "New Weight Record"

    fill_in "Start weight", with: @weight_record.start_weight
    fill_in "User", with: @weight_record.user_id
    fill_in "Weight", with: @weight_record.weight
    click_on "Create Weight record"

    assert_text "Weight record was successfully created"
    click_on "Back"
  end

  test "updating a Weight record" do
    visit weight_records_url
    click_on "Edit", match: :first

    fill_in "Start weight", with: @weight_record.start_weight
    fill_in "User", with: @weight_record.user_id
    fill_in "Weight", with: @weight_record.weight
    click_on "Update Weight record"

    assert_text "Weight record was successfully updated"
    click_on "Back"
  end

  test "destroying a Weight record" do
    visit weight_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weight record was successfully destroyed"
  end
end
