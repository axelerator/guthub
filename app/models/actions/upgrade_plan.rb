module Actions
  class UpgradePlan < SeriousBusiness::Action
    needs :account
    needs :plan

    allow_if {|action| action.actor.admin? }
    forbid_if :not_manager  do |action|
      action.actor.roles
        .where(account_id: action.account.id).empty?
    end

    def execute
      account.update_attributes(plan: plan)
      [account]
    end
  end
end

