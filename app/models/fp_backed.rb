class FpBacked < ApplicationRecord
    has_many :pledges
    has_many :funding_projects, through: :pledges
    # has_many :pledges
    # has_many :fp_backers, through: :pledges
end
