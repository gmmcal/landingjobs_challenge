task :import => :environment do
  require 'importer/importer'
  Importer::Importer.import
end
