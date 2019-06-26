class FundingProject < ApplicationRecord
      
    has_many :pledges
    has_many :funding_project_fp_creators
    has_many :fp_creators, through: :funding_project_fp_creators
    accepts_nested_attributes_for :fp_creators
    has_many :fp_backer_funding_projects
    has_many :fp_backers, through: :fp_backer_funding_projects
    
    validates_presence_of :title
    validates_uniqueness_of :title
    validates_presence_of :description
    validates_presence_of :funding_goal
        
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

    def self.all_funding_projects
        all.order(title: :asc)
    end  
    
    def total_pledges
        self.pledges.sum(:amount)
    end

    def amount_needed
        self.funding_goal - total_pledges
    end

    def fp_creators_attributes=(fp_creators_attributes)
        fp_creators_attributes.values.each do |fc_attribute|
        fc = FpCreator.find_by(fc_attribute) 
        self.fp_creators << fc
        end 
    end
end

