require "test_helper"

class PaymentAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_account = payment_accounts(:one)
  end

  test "should get index" do
    get payment_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_account_url
    assert_response :success
  end

  test "should create payment_account" do
    assert_difference("PaymentAccount.count") do
      post payment_accounts_url, params: { payment_account: { account_number: @payment_account.account_number, bank_address: @payment_account.bank_address, bank_name: @payment_account.bank_name, holder_address: @payment_account.holder_address, holder_name: @payment_account.holder_name, organization_id: @payment_account.organization_id, reference_name: @payment_account.reference_name, sort_code: @payment_account.sort_code } }
    end

    assert_redirected_to payment_account_url(PaymentAccount.last)
  end

  test "should show payment_account" do
    get payment_account_url(@payment_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_account_url(@payment_account)
    assert_response :success
  end

  test "should update payment_account" do
    patch payment_account_url(@payment_account), params: { payment_account: { account_number: @payment_account.account_number, bank_address: @payment_account.bank_address, bank_name: @payment_account.bank_name, holder_address: @payment_account.holder_address, holder_name: @payment_account.holder_name, organization_id: @payment_account.organization_id, reference_name: @payment_account.reference_name, sort_code: @payment_account.sort_code } }
    assert_redirected_to payment_account_url(@payment_account)
  end

  test "should destroy payment_account" do
    assert_difference("PaymentAccount.count", -1) do
      delete payment_account_url(@payment_account)
    end

    assert_redirected_to payment_accounts_url
  end
end
