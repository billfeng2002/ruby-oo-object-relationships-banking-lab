class Transfer
  # your code here
  attr_accessor :sender, :receiver
  attr_accessor :status, :amount
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @status='pending'
    @amount=amount
  end

  def valid?
    return @sender::valid? && @receiver::valid?
  end

  def execute_transaction
    return "already completed" if self.status=='complete'
    if !self.valid?
      self.status='rejected'
      return "Transaction rejected. Please check your account balance." 
    end
    if (self.sender.balance < self.amount)
      self.status="rejected"
      return "Transaction rejected. Please check your account balance."
    else
      self.receiver.deposit(self.amount)
      self.sender.deposit(-1*self.amount)
      self.status='complete'
      return "success"
    end
  end

  def reverse_transfer
    return "not completed" unless self.status=='complete'
    self.sender.deposit(self.amount)
    self.receiver.deposit(-1*self.amount)
    self.status='reversed'
    return "transfer reversed"
  end
end
