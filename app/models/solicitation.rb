class Solicitation < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :loan_amount, presence: true,
                          numericality: { only_integer: true, message: 'Only numbers' },
                          length: { maximum: 10 }
  validates :number_of_installments, presence: true,
                                     numericality: { only_integer: true, message: 'Only numbers' },
                                     length: { maximum: 2 }
  validates :installment_amount, presence: true,
                                 numericality: { only_integer: true, message: 'Only numbers' }
end
