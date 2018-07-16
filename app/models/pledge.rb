class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :funding_project
    accepts_nested_attributes_for :funding_projects

    validates_presence_of :amount
    validates :amount, numericality: true

    def project_pledges=(project_pledge)
        self.funding_project = FundingProject.find_by(title: funding.title)
    end
    #add validation for datatype integer
end
