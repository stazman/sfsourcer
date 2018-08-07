class FpCreator < ApplicationRecord
    belongs_to :user
    has_many :funding_projects
end
