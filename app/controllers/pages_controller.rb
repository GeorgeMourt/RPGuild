class PagesController < ApplicationController

  
  def index
    @general_discussion_posts = Post.by_branch('general_discussion').limit(8)
    @looking_for_players_posts = Post.by_branch('looking_for_players').limit(8)
    @looking_for_gm_posts = Post.by_branch('looking_for_gm').limit(8)
    @contacts = user_signed_in? ? current_user.all_active_contacts : ''
  end

end
