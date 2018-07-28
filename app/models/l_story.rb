class LStory < ApplicationRecord
    # has_many :users NOTE: This is for an API wherein many users can add to the same textarea; now usrs made a story through comments
    belongs_to :user
    has_many :l_story_o_genres
    has_many :o_genres, through: :l_story_o_genres
    # has_many :l_story_o_genres
    # has_many :o_genres, through: :l_story_o_genres
    accepts_nested_attributes_for :o_genres

    validates_presence_of :title
    validates_presence_of :content

end
