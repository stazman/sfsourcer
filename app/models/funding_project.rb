class FundingProject < ApplicationRecord
    has_many :pledges
    has_many :users, through: :pledges

    validates_presence_of :title
    validates_uniqueness_of :title
    validates_presence_of :description
    validates_presence_of :funding_goal

    def make_title_case
        self.title = self.title.titlecase
    end

    # def comment_attributes=(comment_attribute)
    # end
end
