class SolicitationsController < ApplicationController
  require "bigdecimal"

  def show
    @solicitation = Solicitation.find(params[:id])
    @dates = bill_payment_date(@solicitation.created_at, @solicitation.number_of_installments)
  end

  def new
    @solicitation = Solicitation.new
  end

  def create
    @solicitation = Solicitation.new(solicitation_params)
    @solicitation.user = current_user
    @solicitation.installment_amount = pmt_function(@solicitation.loan_amount, @solicitation.number_of_installments)
    if @solicitation.save
      redirect_to solicitation_path(@solicitation), notice: 'Your solicitation was successfully created'
    else
      render :new
    end
  end

  private

  def solicitation_params
    params.require(:solicitation).permit(:loan_amount, :number_of_installments)
  end

  def pmt_function(loan_amount, number_of_installments)
    rate = BigDecimal("0.015")
    n_installments = BigDecimal(number_of_installments)
    one = BigDecimal(1)
    @installment_amount = BigDecimal(loan_amount) * ((((one + rate) ** n_installments) * rate) / (((one + rate) ** n_installments) - one))
    @installment_amount.truncate(2).round
  end

  def bill_payment_date(start_date, number_of_installments)
    dates = []
    date_range = (1..number_of_installments).to_a
    date_range.each do |number|
      dates << start_date + number.months
    end
    dates
  end
end
