class FpCreator < ApplicationRecord
    belongs_to :user
    # belongs_to :user_fp_creators
    # has_many :funding_projects

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
