require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "account can be upgraded by admin" do
    account = accounts(:one)
    plan = plans(:two)

    user = users(:admin)
    action = user.upgrade_plan.for_account(account).for_plan(plan)
    assert action.execute!
    assert_equal plan, Account.find(account.id).plan
  end

  test "account can be upgraded by account_manager of that account" do
    account = accounts(:one)
    plan = plans(:two)

    user = users(:account_manager_one)
    action = user.upgrade_plan.for_account(account).for_plan(plan)
    assert action.execute!
    assert_equal plan, Account.find(account.id).plan
  end

  test "account can NOT be upgraded by account_manager of other account" do
    account = accounts(:one)
    plan = plans(:two)

    user = users(:account_manager_one)
    action = user.upgrade_plan.for_account(account).for_plan(plan)
    refute action.execute!
    assert_not_equal plan, Account.find(account.id).plan
  end

end
