class Pledge < ApplicationRecord
    belongs_to :user
    belongs_to :funding_project

    validates_presence_of :amount
    validates :amount, numericality: true
    #add validation for datatype integer
end
