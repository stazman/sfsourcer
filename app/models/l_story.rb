class LStory < ApplicationRecord
    has_many :ls_comments
    has_many :ls_users, through: :ls_comments

    # validates_presence_of :title
    # validates_presence_of :content

    def self.all_living_stories
      all.order(title: :asc)
    end
end
