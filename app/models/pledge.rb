class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :funding_project

    # validates presence of amount
end
