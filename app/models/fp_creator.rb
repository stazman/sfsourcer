class FpCreator < ApplicationRecord
    has_many :funding_project_fp_creators
    has_many :funding_projects, through: :funding_project_fp_creators  
end
