require 'test_helper'

class ContractorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contractor = contractors(:one)
  end

  test "should get index" do
    get contractors_url
    assert_response :success
  end

  test "should get new" do
    get new_contractor_url
    assert_response :success
  end

  test "should create contractor" do
    assert_difference('Contractor.count') do
      post contractors_url, params: { contractor: { adress: @contractor.adress, birthday: @contractor.birthday, description: @contractor.description, name: @contractor.name, phone_number: @contractor.phone_number, prefectures: @contractor.prefectures, user_id: @contractor.user_id } }
    end

    assert_redirected_to contractor_url(Contractor.last)
  end

  test "should show contractor" do
    get contractor_url(@contractor)
    assert_response :success
  end

  test "should get edit" do
    get edit_contractor_url(@contractor)
    assert_response :success
  end

  test "should update contractor" do
    patch contractor_url(@contractor), params: { contractor: { adress: @contractor.adress, birthday: @contractor.birthday, description: @contractor.description, name: @contractor.name, phone_number: @contractor.phone_number, prefectures: @contractor.prefectures, user_id: @contractor.user_id } }
    assert_redirected_to contractor_url(@contractor)
  end

  test "should destroy contractor" do
    assert_difference('Contractor.count', -1) do
      delete contractor_url(@contractor)
    end

    assert_redirected_to contractors_url
  end
end
