require "rails_helper"

RSpec.feature "Infinite scroll", :type => :feature do
  Post.per_page = 15  

  let(:check_posts_count) do
    expect(page).to have_selector('.single-post-list', count: 15)
    page.execute_script("$(window).scrollTop($(document).height())")
    expect(page).to have_selector('.single-post-list', count: 30)
  end

  scenario "User scrolls down the general_discussion page 
            and posts list will be appended with older posts", js: true do      
    create_list(:post, 30, category: create(:category, branch: 'general_discussion'))     
    visit general_discussion_posts_path
    check_posts_count
  end

  scenario "User scrolls down the looking_for_players page 
            and posts list will be appended with older posts", js: true do      
    create_list(:post, 30, category: create(:category, branch: 'looking_for_players'))        
    visit looking_for_players_posts_path
    check_posts_count
  end

  scenario "User scrolls down the looking_for_gm page 
            and posts list will be appended with older posts", js: true do      
    create_list(:post, 30, category: create(:category, branch: 'looking_for_gm'))      
    visit looking_for_gm_posts_path
    check_posts_count
  end

end
