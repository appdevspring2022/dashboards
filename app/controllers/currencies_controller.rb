class CurrenciesController < ApplicationController
  def first_currency
    render({ :templates => "currency_templates/step_one.html.erb" })
  end
end


