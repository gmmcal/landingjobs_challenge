require 'rails_helper'

RSpec.describe Language, type: :model do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_uniqueness_of(:name) }

  it 'has a valid factory' do
    expect(build(:language)).to be_valid
  end

  context 'is invalid' do
    it 'without a name' do
      language = build(:language, name: nil)
      language.valid?
      expect(language.errors[:name]).to include("can't be blank")
    end

    it 'with duplicate name' do
      create(:language, name: "foo")
      language = build(:language, name: "foo")
      language.valid?
      expect(language.errors[:name]).to include("has already been taken")
    end
  end

  context 'is valid' do
  end
end
