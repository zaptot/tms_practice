class CurrenciesController < ApplicationController
  rescue_from Currencies::Requester::ServiceUnavailable do
    render json: { errors: 'Service unavailable' }, status: :service_unavailable
  end
  rescue_from Currencies::GetRate::BadParams do |e|
    render json: { errors: e.message }, status: :bad_request
  end

  def index
    render json: Currencies::AvailableCurrencies.call
  end

  def convert
    render json: Currencies::ConvertCurrency.call(from: params[:from], to: params[:to], amount: params[:amount])
  end
end
