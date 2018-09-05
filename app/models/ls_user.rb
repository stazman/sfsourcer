class LsUser < ApplicationRecord
    has_many :ls_comments
    has_many :l_stories, through: :ls_comments
end
