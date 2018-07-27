class OGenre < ApplicationRecord
    # belongs_to :l_story
    has_many :l_story_o_genres
    has_many :l_stories, through: :l_story_o_genres
end
