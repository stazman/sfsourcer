class FpBacker < ApplicationRecord
    has_many :pledges
    has_many :funding_projects, through: :pledges
end
