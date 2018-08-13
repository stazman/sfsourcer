class FundingProject < ApplicationRecord
      
    class Pledge < ApplicationRecord
        has_many :funding_project_pledges
        has_many :funding_projects, through: :funding_project_pledges
        has_many :fp_backer_pledges
        has_many :fp_backers, through: :fp_backer_pledges
           
        # validates_presence_of :amount
        # validates :amount, numericality: true
    
        # def funding_project_title=(funding_project_title)
        #     self.funding_project.title = FundingProject.find_by(title: funding_project_title)
        # end
        def fp_backer_name
            self.try(:fp_backer).try(:name)
        end
    
        def fp_backer_name=(name)
            fpb = FpBacker.find_or_create_by(name: name)
            self.fp_backer = fpb
        end
    
        def funding_project_attributes=(funding_project_attributes)
            funding_project_attributes.values.each do |fp_attribute|
            fp = FundingProject.find(fp_attribute) 
            self.funding_projects << fp
            end
        end 
    end
    
    
    
    # def funding_project_name
    #     self.try(:funding_project).try(:name)
    # end
    
    
        # def fp_backed_name
        #     self.try(:fp_backed).try(:name)
        # end
        # # but how does this work from just the parameters??? what mechanism takes what instance through the strong params and how does it do it?
        # def fp_backed_name=(name)
        #     fpb = FpBacked.find_or_create_by(name: name)
        #     self.fp_backed = fpb
        # end
    
    has_many :funding_project_fp_creators
    has_many :fp_creators, through: :funding_project_fp_creators
    accepts_nested_attributes_for :fp_creators
    has_many :fp_backer_funding_projects
    has_many :fp_backers, through: :fp_backer_funding_projects
    has_many :funding_project_pledges
    has_many :pledges, through: :pledge_funding_projects

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
    
    def fp_creators_attributes=(fp_creators_attributes)
        fp_creators_attributes.values.each do |fc_attribute|
        fc = FpCreator.find_or_create_by(fc_attribute) 
        self.fp_creators << fc
        end 
    end

    # order/groupby

    # def total_pledges
    #     self.pledges.map do |p| 
    #        p.amount     
    #     end
    # end
end


    # def funding_project_pledge
    #     self.pledge = Pledge.create(amount: :amount)
    # end
    
    # def funding_project_pledge
    #     self.pledge ? self.pledge.amount : nil
    # end
    # def comment_attributes=(comment_attribute)
    # end
        # def comment_attributes=(comment)
    #     self.comment = Comment.create_by(title = comment.title)
    #     self.comment.update(comment)
    # end

