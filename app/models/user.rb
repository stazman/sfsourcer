class User < ApplicationRecord
    has_many :pledges
    has_many :funding_projects, through: :pledges

    validates_presence_of :name
    validates_presence_of :password
    validates_presence_of :email
    validates_uniquenessof :email




end
