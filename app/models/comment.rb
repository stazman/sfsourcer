class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :funding_project
end
