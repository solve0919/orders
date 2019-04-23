require "application_system_test_case"

class RequestsTest < ApplicationSystemTestCase
  setup do
    @request = requests(:one)
  end

  test "visiting the index" do
    visit requests_url
    assert_selector "h1", text: "Requests"
  end

  test "creating a Request" do
    visit requests_url
    click_on "New Request"

    fill_in "Adress", with: @request.adress
    fill_in "Contractor", with: @request.contractor_id
    fill_in "Delivery", with: @request.delivery
    fill_in "Hope", with: @request.hope
    fill_in "Money", with: @request.money
    fill_in "Note", with: @request.note
    fill_in "Order", with: @request.order_id
    fill_in "Payment", with: @request.payment
    fill_in "Quantity", with: @request.quantity
    fill_in "Receive", with: @request.receive
    fill_in "Status", with: @request.status
    click_on "Create Request"

    assert_text "Request was successfully created"
    click_on "Back"
  end

  test "updating a Request" do
    visit requests_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @request.adress
    fill_in "Contractor", with: @request.contractor_id
    fill_in "Delivery", with: @request.delivery
    fill_in "Hope", with: @request.hope
    fill_in "Money", with: @request.money
    fill_in "Note", with: @request.note
    fill_in "Order", with: @request.order_id
    fill_in "Payment", with: @request.payment
    fill_in "Quantity", with: @request.quantity
    fill_in "Receive", with: @request.receive
    fill_in "Status", with: @request.status
    click_on "Update Request"

    assert_text "Request was successfully updated"
    click_on "Back"
  end

  test "destroying a Request" do
    visit requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request was successfully destroyed"
  end
end
