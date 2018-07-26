class FpCreator < ApplicationRecord
    # has_many :funding_projects
    belongs_to :user
    # accepts_nested_attributes_for :funding_projects
end
