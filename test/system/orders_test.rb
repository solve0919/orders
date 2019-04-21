require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address", with: @order.address
    fill_in "Aparatment", with: @order.aparatment
    fill_in "Birthday", with: @order.birthday
    fill_in "Description", with: @order.description
    fill_in "Email", with: @order.email
    fill_in "Name", with: @order.name
    fill_in "Phone Number", with: @order.phone_number
    fill_in "Postal Code", with: @order.postal_code
    fill_in "Prefectures", with: @order.prefectures
    fill_in "Settlement", with: @order.settlement
    fill_in "User", with: @order.user_id
    fill_in "Ward", with: @order.ward
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "Aparatment", with: @order.aparatment
    fill_in "Birthday", with: @order.birthday
    fill_in "Description", with: @order.description
    fill_in "Email", with: @order.email
    fill_in "Name", with: @order.name
    fill_in "Phone Number", with: @order.phone_number
    fill_in "Postal Code", with: @order.postal_code
    fill_in "Prefectures", with: @order.prefectures
    fill_in "Settlement", with: @order.settlement
    fill_in "User", with: @order.user_id
    fill_in "Ward", with: @order.ward
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
