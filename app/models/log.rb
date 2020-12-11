class Log < ApplicationRecord
  belongs_to :account
  belongs_to :operation
end
