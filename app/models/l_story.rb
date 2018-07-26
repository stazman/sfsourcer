class LStory < ApplicationRecord
    has_many :l_story_o_genres
    has_many :o_genres, through: :l_story_o_genres
    accepts_nested_attributes_for :o_genres
end
