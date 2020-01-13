require "rails_helper"

RSpec.feature "Visit single post", :type => :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  scenario "User goes to a single post from the home page", js: true do
    post
    visit root_path
    page.find(".single-post-card").click
    expect(page).to have_css('body .modal')
    page.find('.interested a').click
    expect(page).to have_css('#single-post-content p', text: post.content)
  end

end
