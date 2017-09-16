class User < ApplicationRecord
  authenticates_with_sorcery!
  include SeriousBusiness::Actor

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
end
Dir[Rails.root.join('app','models', 'actions', '*.rb')].each {|file| require_dependency file }
