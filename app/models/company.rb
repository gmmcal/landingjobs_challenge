class Company < ActiveRecord::Base
  has_and_belongs_to_many :languages, autosave: true

  validates :name, presence: true
  validates :logo_url, presence: true
  validates :website_url, presence: true
end
