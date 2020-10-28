class SolicitationsController < ApplicationController
  def show
    @solicitation = Solicitation.find(params[:id])
  end
end
