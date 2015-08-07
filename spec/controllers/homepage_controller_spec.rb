require 'rails_helper'

RSpec.describe HomepageController, type: :controller do

  describe "GET #index" do
    let(:company1) { create(:company) }
    let(:company1) { create(:company) }
    let(:language1) { create(:language, companies: [company1]) }
    let(:language2) { create(:language, companies: [company1]) }

    before(:each) do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "assigns all languages as @languages" do
      expect(assigns(:languages)).to eq([language1, language2])
    end
  end

  describe "GET #companies" do
    let(:company1) { create(:company) }
    let(:company2) { create(:company) }
    let(:language1) { create(:language, companies: [company1, company2]) }
    let(:language2) { create(:language, companies: [company1]) }
    let(:language3) { create(:language) }

    context 'search for language1' do
      before(:each) do
        xhr :get, :companies, ids: language1.id.to_s, format: :js
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template(:companies, format: :js)
      end

      it "assigns all companies as @companies" do
        expect(assigns(:companies)).to eq([company1, company2])
      end
    end

    context 'search for language2' do
      before(:each) do
        xhr :get, :companies, ids: language2.id.to_s, format: :js
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template(:companies, format: :js)
      end

      it "assigns all companies as @companies" do
        expect(assigns(:companies)).to eq([company1])
      end
    end

    context 'search for language3' do
      before(:each) do
        xhr :get, :companies, ids: language3.id.to_s, format: :js
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template(:companies, format: :js)
      end

      it "assigns all companies as @companies" do
        expect(assigns(:companies)).to be_empty
      end
    end
  end

end
