class FundingProject < ApplicationRecord
    has_many :pledges
    has_many :users, through: :pledges
    # belongs_to :fp_creator
    # belongs_to :user
    # has_many :comments
    # has_many :users, through: :comments
    # accepts_nested_attributes_for :comments


    validates_presence_of :title
    validates_uniqueness_of :title
    validates_presence_of :description
    validates_presence_of :funding_goal
    
    # def comment_attributes=(comment)
    #     self.comment = Comment.create_by(title = comment.title)
    #     self.comment.update(comment)
    # end
    
    def make_title_case
        self.title = self.title.titlecase
    end

    def self.ready_for_countdown
        still_need_funds = FundingProject.where(total_pledges.amount <= self.funding_goal * .8) 
        order("still_need_funds ASC")
        # select all funding projects that still have funds to raise
        # select all funding projects that only have 80 left to raise
        # order them by the least left
        # show them on a static page
    end
    
    # order/groupby

    def total_pledges
        self.pledges.map do |p| 
           p.amount     
        end
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
