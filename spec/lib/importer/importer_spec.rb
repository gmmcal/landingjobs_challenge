require 'rails_helper'
require 'rest-client'
require 'webmock/rspec'
require 'importer/importer'

RSpec.describe Importer::Importer do
  describe 'companies requests' do
    before(:each) do
      companies = File.read('spec/lib/fixtures/get_companies.json')
      response = stub_request(:get, 'https://landing.jobs/api/v1/companies.json').to_return(companies)
      @companies_json = JSON.parse(response.response.body)
    end

    it "should return a JSON with companies" do
      expect(Importer::Importer.send(:get_companies)).to eq(@companies_json)
    end

    it "should return a JSON with companies" do
      Importer::Importer.send(:import_companies, @companies_json)
      expect(Company.all.size).to eq(@companies_json.size)
    end
  end

  describe '#get_offers' do
    before(:each) do
      offers = File.read('spec/lib/fixtures/get_offers.json')
      response = stub_request(:get, 'https://landing.jobs/api/v1/offers.json').to_return(offers)
      @offers_json = JSON.parse(response.response.body)
    end

    it "should return a JSON with offers" do
      expect(Importer::Importer.send(:get_offers)).to eq(@offers_json)
    end
  end
end
