class AccountFactory < AbstractFactory
  def self.create(type)
    case type
    when 'system'
      SystemAccount.new
    when 'admin'
      AdminAccount.new
    when 'shopper'
      ShopperAccount.new
    end
  end
end
