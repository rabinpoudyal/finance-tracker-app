class Stock < ActiveRecord::Base

  #Create a method that goes to db and looks if the stock exists?
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  #Method to simply search stock from yahoo api
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name

    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end

  #Method to calculate the price of stock
  def price
    closing_price = StockQuote::Stock.quote(ticker).open
    return "#{closing_price} (Closing Price)" if closing_price

    opening_price = StockQuote::Stock.quote(ticker).closing_price
    return "#{opening_price} (Opening Price)" if opening_price
    'Unavailable'
  end
end
