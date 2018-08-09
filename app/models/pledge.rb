class Pledge < ApplicationRecord
    belongs_to :fp_backed
    belongs_to :funding_project
    # belongs_to :fp_backer
   
    # def funding_project_title=(funding_project_title)
    #     self.funding_project.title = FundingProject.find_by(title: funding_project_title)
    # end
    def pledges_attributes=(pledges_attributes)
        pledges_attributes.values.each do |pledge_attribute|
        p = Pledge.find_by(pledge_attribute)
        self.fp_backeds << p
    end

    validates_presence_of :amount
    validates :amount, numericality: true
end
