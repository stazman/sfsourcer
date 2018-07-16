class FundingProject < ApplicationRecord
    has_many :pledges
    has_many :users, through: :pledges
    # accepts_nested_attributes_for :pledges

    validates_presence_of :title
    validates_uniqueness_of :title
    validates_presence_of :description
    validates_presence_of :funding_goal
    
    

    def make_title_case
        self.title = self.title.titlecase
    end

    # def funding_project_pledge
    #     self.pledge = Pledge.create(amount: :amount)
    # end
    
    # def funding_project_pledge
    #     self.pledge ? self.pledge.amount : nil
    # end
    # def comment_attributes=(comment_attribute)
    # end
end
