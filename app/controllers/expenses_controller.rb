class ExpensesController < ApplicationController

  before_action :find_user, except: [:approve]

  def index
    if params[:approved].nil?
      @expenses = @user.expenses.non_deleted
    else
      @expenses = @user.expenses.non_deleted.approval_state(params[:approved])
    end

    if !params[:min_amount].nil?
      @expenses = @expenses.gt_expense(params[:min_amount])
    end

    if !params[:max_amount].nil?
      @expenses = @expenses.lt_expense(params[:max_amount])
    end
  end

  def new
  end

  def create

    @expense = @user.expenses.new(expense_params)

    if @expense.save
      ExpenseNotifier.new(@expense.id).notify

      redirect_to user_expenses_path(@user)
    else
      render :new, status: :bad_request
    end
  end

  def update

    @expense = @user.expenses.find(params[:id])

    if !@expense.approved
      @expense.update_attributes!(expense_params)
      flash[:notice] = 'Your expense has been successfully updated'
      redirect_to user_expenses_path(user_id: @user.id)
    else
      flash[:error] = 'You cannot update an approved expense'
      render :edit
    end
  end

  def approve
    @expense = Expense.find(params[:expense_id])
    @expense.update_attributes!(approved: true)

    render :show
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.update_attributes!(deleted: true)

    redirect_to user_expenses_path(user_id: @user.id)
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :approved)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
