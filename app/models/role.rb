class Role < ApplicationRecord
  belongs_to :user

  class Admin < Role
  end

  class AccountManager < Role
    belongs_to :account
  end

  class Dev < Role
    belongs_to :account
  end
end
