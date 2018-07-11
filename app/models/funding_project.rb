class FundingProject < ApplicationRecord
    has_many :pledges
    has_many :users, through: :pledges

    validates_presence_of :title
    validates_uniqueness_of :title
    validates_presence_of :description
    validates_presence_of :funding_amount

    # def comment_attributes=(comment_attribute)
    # end
end
