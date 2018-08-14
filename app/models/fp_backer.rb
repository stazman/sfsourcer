class FpBacker < ApplicationRecord
    # has_many :pledges
    # has_many :funding_projects
# has_many :fp_backer_funding_projects
    # has_many :funding_projects, through: :fp_backer_funding_projects
    # accepts_nested_attributes_for :funding_projects
    has_many :pledges
    has_many :funding_projects
    # has_many :pledges, through: :fp_backer_pledges
    accepts_nested_attributes_for :pledges
    accepts_nested_attributes_for :funding_projects

    def pledges_attributes=(pledges_attributes)
        pledges_attributes.values.each do |p_attribute|
        p = Pledge.find(p_attribute) 
        self.pledges << p
        end
    end 

    def funding_projects_attributes=(funding_projects_attributes)
        funding_projects_attributes.values.each do |fp_attribute|
        fp = FundingProject.find(fp_attribute) 
        self.funding_projects << fp
        end
    end 
end



    # has_many :funding_projects, through: :pledges
    # has_many :funding_projects
    # has_many :user_fp_backers
    # has_many :users, through: :user_fp_backers
    # this may be better as a has many but not has many through, maybe depending on polymorphic with only other classes involved such as comments
    # fp_backer only has one user so has one may be better relatioship in the end
