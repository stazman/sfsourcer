class FundingProject < ApplicationRecord
    has_many :pledges
    has_many :users, through: :pledges

    validates presence of title
    validates uniqueness of title
    validates presence of description
    validates presence of funding_amount

    # def comment_attributes=(comment_attribute)
    # end
end
