class FpBackedPledge < ApplicationRecord
  belongs_to :fp_backed
  belongs_to :pledge
end
