class UserFpCreator < ApplicationRecord
    belongs_to :user
    belongs_to :fp_creator
end
