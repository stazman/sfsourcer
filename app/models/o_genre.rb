class OGenre < ApplicationRecord
    has_many :l_story_genres
    has_many :l_stories, through: :l_story_o_genres
    has_many :users, through: :l_stories
end
