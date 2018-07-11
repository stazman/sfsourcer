class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :funding_project

    validates_presence_of :amount
    #add validation for datatype integer
end
