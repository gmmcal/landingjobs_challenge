class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :short_pitch
      t.text :description
      t.string :logo_url
      t.string :website_url

      t.timestamps null: false
    end
  end
end
