class AddressController < ApplicationController
  def new
  
  end
  
  def create
    @address = Adress.new
  end
end
