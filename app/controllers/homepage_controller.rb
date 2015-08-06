class HomepageController < ApplicationController
  def index
    @languages = Language.trending
  end

  def companies
    @companies = Company.includes(:languages).where(languages: { id: params[:ids].split(',') })
  end
end
