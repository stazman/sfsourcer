class Pledge < ApplicationRecord
    belongs_to :funding_project
    belongs_to :fp_backer
   
    # validates_presence_of :amount
    # validates :amount, numericality: true

    def funding_project_title=(funding_project_title)
        self.funding_project.title = FundingProject.find_by(title: funding_project_title)
    end
end



# def funding_project_name
#     self.try(:funding_project).try(:name)
# end

# def funding_project_name=(name)
#     fp = FundingProject.find_by(name: name)
#     self.funding_project = fp
# end

    # def fp_backed_name
    #     self.try(:fp_backed).try(:name)
    # end
    # # but how does this work from just the parameters??? what mechanism takes what instance through the strong params and how does it do it?
    # def fp_backed_name=(name)
    #     fpb = FpBacked.find_or_create_by(name: name)
    #     self.fp_backed = fpb
    # end

