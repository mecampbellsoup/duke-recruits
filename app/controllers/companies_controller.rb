class CompaniesController < ApplicationController
  before_action :authenticate_user!
  layout 'application_with_sidebar'

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end
  
  private

  def company_params
    params.require(:company).permit(:name, :description, :website, :image)
  end
end
