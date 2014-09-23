class ExpenseNotifier

  def initialize(expense_id)
    @expense = Expense.find(expense_id)
  end

  def notify
    email_body = "#{@expense.name} by #{@expense.user.full_name} needs to be approved"
    mailer = ExpenseMailer.new(address: 'admin@expensr.com', body: email_body)
    mailer.deliver
  end
end