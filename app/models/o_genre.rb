class OGenre < ApplicationRecord
    has_many :l_story_o_genres
    has_many :l_stories, through: :l_story_o_genres
end
