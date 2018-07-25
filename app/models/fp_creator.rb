class FpCreator < ApplicationRecord
    has_many :funding_projects
    belongs_to :user
end
