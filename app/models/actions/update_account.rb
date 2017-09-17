module Actions
  class UpdateAccount < SeriousBusiness::Action
    needs :account

    att :name, presence: true
    att :plan_id, presence: true

    allow_if {|action| action.actor.admin? }
    forbid_if :not_manager  do |action|
      action.actor.roles
        .where(account_id: action.account.id).empty?
    end

    def init_from_needed
      all_attributes_from(account)
    end

    def execute
      account.update_attributes(form_model.attributes)
      [account]
    end
  end
end


