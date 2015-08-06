class Language < ActiveRecord::Base
  has_and_belongs_to_many :companies, autosave: true

  scope :trending, -> { order('(select COUNT(*) from companies_languages where language_id = languages.id) DESC').limit(20) }

  validates :name, presence: true, uniqueness: true
end
