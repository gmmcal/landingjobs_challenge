class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :logo_url, presence: true
  validates :website_url, presence: true
end
