require 'spec_helper'

describe RecipesController do
  render_views
  describe 'index' do
    before do
      Recipe.create!(name: 'Baked Potato w/ Cheese')
      Recipe.create!(name: 'Garlic Mashed Potatoes')
      Recipe.create!(name: 'Potatoes Au Gratin')
      Recipe.create!(name: 'Baked Brussel Sprouts')

      get :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object['name'] }
    end

    context 'when the search finds results' do
      let(:keywords) { 'baked' }

      it 'should succeed' do
        response.status.should eq(200)
      end

      it 'should return two results' do
        results.size.should eq 2
      end

      it "should include 'Baked Potato w/ Cheese'" do
        results.map(&extract_name).should include('Baked Potato w/ Cheese')
      end
      it "should include 'Baked Brussel Sprouts'" do
        results.map(&extract_name).should include('Baked Brussel Sprouts')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        results.size.should eq 0
      end
    end
  end
end
