module Importer
  class Importer
    class << self
      def import
        companies = self.get_companies
        import_companies(companies)
        offers = self.get_offers
        import_languages(offers)
      end

      protected
        def get_companies
          endpoint = "/companies.json"
          companies = self.get_json_response(endpoint)
        end

        def get_offers
          endpoint = "/offers.json"
          offers = self.get_json_response(endpoint)
        end

        def import_companies(companies)
          companies.each do |json_company|
            company = Company.find(json_company['id']) rescue Company.new
            company.update(json_company)
          end
        end

        def import_languages(offers)
          offers.each do |offer|
            company_id = offer['company_id']
            tags = offer['tags']
            tags.each do |tag|
              language = Language.find_or_create_by(name: tag)
              company = Company.find(company_id) rescue nil
              if !company.nil? and !language.companies.include?(company)
                language.companies << company
              end
            end
          end
        end

        def get_json_response(endpoint)
          api_url = "http://landing.jobs/api/v1"
          headers = { Authorization: "Token token=#{ENV['landingjobs_access_token']}" }
          response = RestClient.get "#{api_url}#{endpoint}", headers
          JSON.parse(response.body)
        end
    end
  end
end
