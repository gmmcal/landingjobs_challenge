class HomepageController < ApplicationController
  def index
    @languages = Language.all
  end

  def companies
    @companies = Company.includes(:languages).where(languages: { id: params[:ids].split(',') })
  end
end
