class FundingProject < ApplicationRecord
    has_many :pledges
    has_many :users, through: :pledges
end
