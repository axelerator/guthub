require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "account can be upgraded" do
    account = accounts(:one)
    plan = plans(:two)

    user = users(:admin)

    action = user.upgrade_plan.for_account(account).for_plan(plan)

    assert action.execute!

    assert_equal plan, Account.find(account.id).plan


  end
end
