class Account < ApplicationRecord
  has_many :orders
  has_one :account_rank, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :logs

  enum account_type: {
    systemadmin: 0,
    administrator: 1,
    shopper: 2
  }

  scope :system_user, -> { where(account_type: Account.account_types[:systemadmin]).last }
end
