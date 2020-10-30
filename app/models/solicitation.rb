class Solicitation < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :loan_amount, presence: true,
                          numericality: { only_integer: true, message: 'Only numbers' },
                          length: { maximum: 9, message: '9 digits max' }
  validates :number_of_installments, presence: true,
                                     numericality: { only_integer: true, message: 'Only numbers' },
                                     length: { maximum: 2, message: '2 digits max' }
  validates :installment_amount, presence: true,
                                 numericality: { only_integer: true, message: 'Only numbers' }
end
