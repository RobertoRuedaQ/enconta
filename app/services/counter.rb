class Counter
	include HTTParty
  base_uri "34.209.24.195/facturas"
  
  attr_accessor :id, :start, :finish

  def initialize(id, start, finish)
    @id = id
    @start = start
    @finish = finish
  end

  def bills_counter
		id = "8672e846-9c89-4dbf-a1cc-b85a2da5abe1"
		start_date = Date.parse "2017-01-01"
		end_date = Date.parse "2017-12-31"
		days = 15
		sum = 0 

		until start_date >= end_date do
		  offset = (start_date + days) < end_date ? start_date + days : end_date
		  bills_quantity = HTTParty.get("http://34.209.24.195/facturas?id=#{id}&start=#{start_date}&finish=#{offset}").parsed_response.to_i
		  sum += bills_quantity
		  puts "The invoice number from #{start_date} to #{offset} is : #{bills_quantity} of a total of #{sum}"
		  start_date = offset + 1
		end
		sum  	
	end
  
end


