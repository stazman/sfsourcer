class LsComment < ApplicationRecord
    belongs_to :l_story
    belongs_to :ls_user
    accepts_nested_attributes_for :ls_user, :reject_if => :all_blank
end
