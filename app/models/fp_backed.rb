class FpBacked < ApplicationRecord
    has_many :pledges
    has_many :funding_projects, through: :pledges
    # has_many :pledges
    # has_many :fp_backers, through: :pledges
    def pledges_attributes=(pledges_attributes)
        pledges_attributes.values.each do |pledge_attribute|
        p = Pledge.create_by(pledge_attribute)
        self.pledges << p
        end
    end
end
