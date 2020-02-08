require 'rails_helper'
RSpec.describe "branches", :type => :request do

  shared_examples 'render_templates' do
    it 'renders a general_discussion template' do
      get '/posts/general_discussion'
      expect(response).to render_template(:general_discussion)
    end

    it 'renders a looking_for_players template' do
      get '/posts/looking_for_players'
      expect(response).to render_template(:looking_for_players)
    end

    it 'renders a looking_for_gm template' do
      get '/posts/looking_for_gm'
      expect(response).to render_template(:looking_for_gm)
    end
  end

  context 'non-signed in user' do
    it_behaves_like 'render_templates'
  end

  context 'signed in user' do
    let(:user) { create(:user) }
    before(:each) { login_as user }

    it_behaves_like 'render_templates'
  end

end
