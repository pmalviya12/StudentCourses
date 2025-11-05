class InstitutesController < ApplicationController
  def new
  	@institute = Institute.new
  	@institute.build_address
  end

  private
  def institute_params
  	params.require(:institute).permit(:name, :code, :description, address_attributes: [:street, :city, :state, :zip_code, :country])
  end
end
