class Expense < ActiveRecord::Base
  belongs_to :user

  validates :amount, presence: true

  scope :non_deleted,     -> { where(deleted: false) }
  scope :approval_state,  -> (state) { where(approved: state) }
  scope :lt_expense,       ->(amt) { where('amount < ?', amt) }
  scope :gt_expense,       ->(amt) { where('amount > ?', amt) }

end
