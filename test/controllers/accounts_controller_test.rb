require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
    login(:admin)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { name: @account.name, plan_id: @account.plan_id } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { name: @account.name, plan_id: @account.plan_id } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end

  test "should upgrade plan" do
    login_admin
    account = accounts(:one)
    plan = plans(:one)

    post upgrade_plan_account_url(account), params: { plan_id: plan.id }
    assert_redirected_to accounts_path

    assert_equal plan, Account.find(account.id).plan
  end
end
