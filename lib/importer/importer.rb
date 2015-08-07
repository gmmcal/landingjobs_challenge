module Importer
  class Importer
    class << self
      def import
        debug "Retrieving companies"
        companies = self.get_companies
        debug "Importing companies"
        import_companies(companies)
        debug "Retrieving offers"
        offers = self.get_offers
        debug "Importing languages from offers"
        import_languages(offers)
      end

      # protected
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
            debug "-> Insert/Update company #{json_company['name']}"
            company = Company.find(json_company['id']) rescue Company.new
            company.update(json_company)
          end
        end

        def import_languages(offers)
          offers.each do |json_offer|
            company_id = json_offer['company_id']
            tags = json_offer['tags']
            debug "-> Inserting languages from offer #{json_offer['title']}"
            tags.each do |tag|
              debug "--> Insert/Update language #{tag}"
              language = Language.find_or_create_by(name: tag)
              company = Company.find(company_id) rescue nil
              if !company.nil? and !language.companies.include?(company)
                language.companies << company
              end
            end
          end
        end

        def get_json_response(endpoint)
          api_url = "https://landing.jobs/api/v1"
          headers = { Authorization: "Token token=#{ENV['landingjobs_access_token']}" }
          response = RestClient.get "#{api_url}#{endpoint}", headers
          JSON.parse(response.body)
        end

        def debug(msg)
          unless Rails.env.test?
            puts msg
            Rails.logger.info msg
          end
        end
    end
  end
end
