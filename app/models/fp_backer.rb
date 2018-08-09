class FpBacker < ApplicationRecord
    has_many :pledges
    has_many :pledges, through: :fp_backed
end
