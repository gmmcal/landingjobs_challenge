class AddCompaniesLanguagesTable < ActiveRecord::Migration
  def change
    create_table :companies_languages, id: false do |t|
      t.belongs_to :company, index: true, foreign_key: true
      t.belongs_to :language, index: true, foreign_key: true
    end
  end
end
