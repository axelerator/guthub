module Actions
  class UpgradePlan < SeriousBusiness::Action
    needs :account
    needs :plan

    def execute
      account.update_attributes(plan: plan)
      [account]
    end
  end
end

