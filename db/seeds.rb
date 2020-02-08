# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def seed_users
  user_id = 0
  10.times do 
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id = user_id + 1
  end
end


def seed_categories
  general_discussion = ['Dungeons and Dragons', 'Pathfinder', 'Shadowrun', 'Cyberpunk 2020', 'Call of Cthulhu', 'Ryuutama', 'Blades in the Dark', 'Dungeon World', 'City of Mist', 'FATE', 'Deadlands Reloaded', 'The Witcher roleplaying game', 'Doctor Who the roleplaying game', 'A Song of Fire and Ice', 'Hot War']
  looking_for_players = ['Dungeons and Dragons', 'Pathfinder', 'Shadowrun', 'Cyberpunk 2020', 'Call of Cthulhu', 'Ryuutama', 'Blades in the Dark', 'Dungeon World', 'City of Mist', 'FATE', 'Deadlands Reloaded', 'The Witcher roleplaying game', 'Doctor Who the roleplaying game', 'A Song of Fire and Ice', 'Hot War']
  looking_for_gm = ['Dungeons and Dragons', 'Pathfinder', 'Shadowrun', 'Cyberpunk 2020', 'Call of Cthulhu', 'Ryuutama', 'Blades in the Dark', 'Dungeon World', 'City of Mist', 'FATE', 'Deadlands Reloaded', 'The Witcher roleplaying game', 'Doctor Who the roleplaying game', 'A Song of Fire and Ice', 'Hot War']

  general_discussion.each do |name|
    Category.create(branch: 'general_discussion', name: name)
  end

  looking_for_players.each do |name|
    Category.create(branch: 'looking_for_players', name: name)
  end

  looking_for_gm.each do |name|
    Category.create(branch: 'looking_for_gm', name: name)
  end
end

def seed_posts
  categories = Category.all

  categories.each do |category|
    5.times do
      Post.create(
        title: Faker::Lorem.sentences[0], 
        content: Faker::Lorem.sentences[0], 
        user_id: rand(1..9), 
        category_id: category.id
      )
    end
  end
end

seed_users
seed_categories
seed_posts
