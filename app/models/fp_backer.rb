class FpBacker < ApplicationRecord
    has_many :pledges
    has_many :funding_projects, through: :pledges
    # has_many :funding_projects
    # has_many :user_fp_backers
    # has_many :users, through: :user_fp_backers
    # this may be better as a has many but not has many through, maybe depending on polymorphic with only other classes involved such as comments
    # fp_backer only has one user so has one may be better relatioship in the end
end
