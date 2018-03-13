class BillsController < ApplicationController
  include HTTParty
  base_uri "34.209.24.195/facturas" 
  
  def index
  	@response = HTTParty.get("http://34.209.24.195/facturas\?id\=#{params[:id]}\&start\=2017-01-01\&finish\=2017-01-15
")
  end

end
