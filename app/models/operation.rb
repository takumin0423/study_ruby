class Operation < ApplicationRecord
  has_many :logs

  enum sub_type: {
    systemadmin: 0,
    admin: 1,
    user: 2
  }
end
