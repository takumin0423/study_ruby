module OrderQuery
  class WithAccount
    attr_reader :relation

    def initialize(relation = Order.all)
      @relation = relation.eager_load(account: [:addresses, :account_rank])
    end

    def by_account(account)
      @relation = @relation.where(accounts: {id: account.id})
      self
    end

    def order_by(param=:id, desc=false)
      desc = desc ? " desc" : ""
      @relation = @relation.order("accounts.#{param}#{desc}")
      self
    end
  end

  class WithProduct
    attr_reader :relation

    def initialize(relation = Order.all)
      @relation = relation.eager_load(:products)
    end

    def by_product(relation=Order.all, product)
      @relation = @relation.where(products: {id: product.id})
      self
    end

    def order_by(param=:id, desc=false)
      desc = desc ? " desc" : ""
      @relation = @relation.order("products.#{param}")
      self
    end
  end
end