class SystemAccount < Account
  after_initialize :set_default_values

  def set_default_values
    self.account_type = Account.account_types[:systemadmin]
  end
end