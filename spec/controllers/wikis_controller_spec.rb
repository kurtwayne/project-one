require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

    describe "WIKI create" do
      it "increases the number of Wiki by 1" do
        expect{wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Wiki,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new wiki" do
        wiki :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to Wiki.last
      end
    end
end
