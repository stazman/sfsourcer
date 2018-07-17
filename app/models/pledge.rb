class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :funding_project
    
    def funding_project_title=(funding_project_title)
        self.funding_project.title = FundingProject.find_by(title: funding_project_title)
    end

    validates_presence_of :amount
    validates :amount, numericality: true
end
