class FpCreator < ApplicationRecord
    has_many :funding_project_fp_creators
    has_many :funding_projects, through: :funding_project_fp_creators  
    # has_many :user_fp_creators
    # has_many :users, through: :user_fp_creators
# this may be more appropriate for fp_creators than fp_backers to have a has many through because fp_creators can have multiple users


    # belongs_to :user_fp_creators
    # has_many :funding_projects
    # def funding_project_attributes=(funding_project_attributes)
    #     funding_project_attributes.values.each do |fp_attribute|
    #     fp = FpProject.find_or_create_by(fp_attribute) 
    #     self.funding_projects << fp
    #     end 
    # end

    # def fpc_user_name
    #     self.try(:user).try(:name)
    # end
    # but how does this work from just the parameters??? what mechanism takes what instance through the strong params and how does it do it?
    # def fpc_user_name=(name)
    #     fpc_user = User.find_by(name: name)
    #     # a different parameter than name here?
    #     self.fpc_user = fpc_user
    # end
end
