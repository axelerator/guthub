class Account < ApplicationRecord
  belongs_to :plan
  include SeriousBusiness::AffectedByActions
end
