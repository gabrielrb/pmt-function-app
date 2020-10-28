class SolicitationsController < ApplicationController
  require "bigdecimal"

  def show
    @solicitation = Solicitation.find(params[:id])
  end

  def pmt_function(loan_amount, number_of_installments)
    rate = BigDecimal('0.015')
    loan_amount * ((((1 + rate) ** number_of_installments) X rate) / (((1 + rate) ** number_of_installments) - 1))
  end
end
