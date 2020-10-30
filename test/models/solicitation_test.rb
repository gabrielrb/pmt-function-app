require 'test_helper'

class SolicitationTest < ActiveSupport::TestCase
  def test_valid
    assert solicitations(:one).valid?
    refute Solicitation.new.valid?
  end

  test "should not save a solicitation without a loan amount" do
    user = users(:one)
    solicitation = Solicitation.new(number_of_installments: 12,
                                    installment_amount: 9168,
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation without a loan amount"
  end

  test "should not save a solicitation without number of installments" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: 100000,
                                    installment_amount: 9168,
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation without number of installments"
  end

  test "should not save a solicitation without a installment amount" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: 100000,
                                    number_of_installments: 12,
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation without a installment amount"
  end

  test "should not save a solicitation without a user" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: 100000,
                                    number_of_installments: 12,
                                    installment_amount: 9168)

    assert_not solicitation.save, "Saved the solicitation without a user"
  end

  test "should not save a solicitation if loan amount length is larger than 9 digits" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: 1000000000,
                                    number_of_installments: 12,
                                    installment_amount: 9168,
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation with a loan amount larger than 9 digits"
  end

  test "should not save a solicitation if number of installments length is larger than 2 digits" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: 100000,
                                    number_of_installments: 122,
                                    installment_amount: 9168,
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation with number of installments larger than 2 digits"
  end

  test "should not save a solicitation if loan amount isn't a digit" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: "ops",
                                    number_of_installments: 12,
                                    installment_amount: 9168,
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation with loan amount not being a digit"
  end

  test "should not save a solicitation if number of installments isn't a digit" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: 100000,
                                    number_of_installments: "not a digit",
                                    installment_amount: 9168,
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation with number of installments not being a digit"
  end

  test "should not save a solicitation if installment amount length is isn't a digit" do
    user = users(:one)
    solicitation = Solicitation.new(loan_amount: 100000,
                                    number_of_installments: 12,
                                    installment_amount: "12f",
                                    user: user)

    assert_not solicitation.save, "Saved the solicitation with installment amount not being a digit"
  end
end
