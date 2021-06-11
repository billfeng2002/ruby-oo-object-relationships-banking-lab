class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    return false if (self.balance <= 0) || (self.status == "closed")
    return true
  end

  def close_account
    self.status = "closed"
  end
end
