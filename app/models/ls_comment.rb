class LsComment < ApplicationRecord
    belongs_to :l_story
    belongs_to :user
    # accepts_nested_attributes_for :user, :reject_if => :all_blank
    def l_story_title=(l_story_title)
        self.l_story.title = l_story.find_by(title: l_story_title)
        
    end
end
