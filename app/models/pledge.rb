class Pledge < ApplicationRecord
    has_many :pledge_funding_projects
    has_many :funding_projects, through: :pledge_funding_projects
    accepts_nested_attributes_for :funding_projects
   
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

