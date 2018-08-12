class PledgeFundingProjects < ApplicationRecord
    belongs_to :pledge
    belongs_to :funding_project
end
