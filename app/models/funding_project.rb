class FundingProject < ApplicationRecord
    has_many :fp_creators
    accepts_nested_attributes_for :fp_creators


    validates_presence_of :title
    validates_presence_of :creator_name
    validates_uniqueness_of :creator_name
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
        still_need_funds = FundingProject.where(total_pledges <= funding_goal) 
        order("still_need_funds ASC")
        # select all funding projects that still have funds to raise
        # select all funding projects that only have 80 left to raise
        # order them by the least left
        # show them on a static page
    end
    
    def fp_creator_attributes=(fp_creator_attributes)
        fp_creator_attributes.values.each do |fc_attribute|
        fc = FpCreator.find_or_create_by(fc_attribute) 
        self.fp_creators << fc
        end 
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
