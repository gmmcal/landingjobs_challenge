require 'rails_helper'

RSpec.describe Company, type: :model do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:logo_url) }
  it { expect(subject).to validate_presence_of(:website_url) }

  it 'has a valid factory' do
    expect(build(:company)).to be_valid
  end

  context 'is invalid' do
    it 'without a name' do
      company = build(:company, name: nil)
      company.valid?
      expect(company.errors[:name]).to include("can't be blank")
    end
    it 'without a logo_url' do
      company = build(:company, logo_url: nil)
      company.valid?
      expect(company.errors[:logo_url]).to include("can't be blank")
    end
    it 'without a website_url' do
      company = build(:company, website_url: nil)
      company.valid?
      expect(company.errors[:website_url]).to include("can't be blank")
    end
  end

  context 'is valid' do
    it 'without a short_pitch' do
      company = build(:company, short_pitch: nil)
      expect(company.valid?).to eq(true)
    end
    it 'without a description' do
      company = build(:company, description: nil)
      expect(company.valid?).to eq(true)
    end
  end
end
