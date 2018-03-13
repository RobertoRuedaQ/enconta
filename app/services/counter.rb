class Counter
	include HTTParty
  base_uri "34.209.24.195/facturas"
  
  attr_accessor :id, :start, :finish

  def initialize(id, start, finish)
    @id = id
    @start = start
    @finish = finish
  end

  def call
    private_method
  end

  def bills_counter
  	total = []
  	count = HTTParty.get("http://34.209.24.195/facturas\?id\=8672e846-9c89-4dbf-a1cc-b85a2da5abe1\&start\=2017-01-01\&finish\=2017-01-30")
  	total_bills = count.parsed_response
  	total.push(total_bills)
  	total
  end
  
end