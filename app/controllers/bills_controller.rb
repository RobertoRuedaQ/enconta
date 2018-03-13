class BillsController < ApplicationController
   
  def index
  	@response = Counter.new("8672e846-9c89-4dbf-a1cc-b85a2da5abe1","2017-01-01","2017-01-30")
  end
end

