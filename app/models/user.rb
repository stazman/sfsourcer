class User < ApplicationRecord
    has_many :pledges
    has_many :funding_projects, through: :pledges

    # validates presence of name
    # validates presence of password
    # validates presence of email
    # validates uniqueness of email




end
