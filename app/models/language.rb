class Language < ActiveRecord::Base
  has_and_belongs_to_many :companies, autosave: true

  validates :name, presence: true, uniqueness: true
end
