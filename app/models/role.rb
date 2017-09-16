class Role < ApplicationRecord
  belongs_to :user

  class Admin
  end

  class AccountManager
    belongs_to :account
  end

  class Dev
    belongs_to :account
  end
end
