require "application_system_test_case"

class PaymentAccountsTest < ApplicationSystemTestCase
  setup do
    @payment_account = payment_accounts(:one)
  end

  test "visiting the index" do
    visit payment_accounts_url
    assert_selector "h1", text: "Payment accounts"
  end

  test "should create payment account" do
    visit payment_accounts_url
    click_on "New payment account"

    fill_in "Account number", with: @payment_account.account_number
    fill_in "Bank address", with: @payment_account.bank_address
    fill_in "Bank name", with: @payment_account.bank_name
    fill_in "Holder address", with: @payment_account.holder_address
    fill_in "Holder name", with: @payment_account.holder_name
    fill_in "Organization", with: @payment_account.organization_id
    fill_in "Reference name", with: @payment_account.reference_name
    fill_in "Sort code", with: @payment_account.sort_code
    click_on "Create Payment account"

    assert_text "Payment account was successfully created"
    click_on "Back"
  end

  test "should update Payment account" do
    visit payment_account_url(@payment_account)
    click_on "Edit this payment account", match: :first

    fill_in "Account number", with: @payment_account.account_number
    fill_in "Bank address", with: @payment_account.bank_address
    fill_in "Bank name", with: @payment_account.bank_name
    fill_in "Holder address", with: @payment_account.holder_address
    fill_in "Holder name", with: @payment_account.holder_name
    fill_in "Organization", with: @payment_account.organization_id
    fill_in "Reference name", with: @payment_account.reference_name
    fill_in "Sort code", with: @payment_account.sort_code
    click_on "Update Payment account"

    assert_text "Payment account was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment account" do
    visit payment_account_url(@payment_account)
    click_on "Destroy this payment account", match: :first

    assert_text "Payment account was successfully destroyed"
  end
end
