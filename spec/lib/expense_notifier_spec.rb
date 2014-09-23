require 'spec_helper'
require 'expense_notifier'

describe ExpenseNotifier do

  before do
    @expense = create(:expense)
  end

  describe "#new" do
    it "calls find on Expense" do
      expect(Expense).to receive(:find).with(@expense.id)

      ExpenseNotifier.new(@expense.id)
    end
  end
end