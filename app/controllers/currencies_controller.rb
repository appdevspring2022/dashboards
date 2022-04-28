class CurrenciesController < ApplicationController
  def first_currency
    currencies_url="https://api.exchangerate.host/symbols"
    @raw_response=open(currencies_url).read
    @parsed_response=JSON.parse(@raw_response)
    @symbols=@parsed_response.fetch("symbols")
    @array_of_symbols=@symbols.keys
    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency
    currencies_url="https://api.exchangerate.host/symbols"
    @raw_response=open(currencies_url).read
    @parsed_response=JSON.parse(@raw_response)
    @symbols=@parsed_response.fetch("symbols")
    @array_of_symbols=@symbols.keys
    @from_currency=params.fetch("from_currency")

    render({:template => "currency_templates/step_two.html.erb"})
  end

  def third_currency
    @from_currency=params.fetch("from_currency")
    @to_currency=params.fetch("to_currency")
    url="https://api.exchangerate.host/convert?from="+@from_currency+"&to="+@to_currency
    @raw_response=open(url).read
    @parsed_response=JSON.parse(@raw_response)
    @rate=@parsed_response.fetch("info").fetch("rate")


    render({:template => "currency_templates/step_three.html.erb"})

  end
end


