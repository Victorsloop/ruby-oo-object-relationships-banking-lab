class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status
  
  
  def initialize(sender, receiver,amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 

  def valid?
    if @sender.valid? && @receiver.valid? 
      return true 
    else 
      return false
    end
  end 

  def execute_transaction
    if valid? && sender.balance > @amount && @status == "pending"
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
   else
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
     end 
  end 

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.balance += @amount
      @receiver.balance -= @amount
    end
  end

end



