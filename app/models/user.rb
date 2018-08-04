class User < ApplicationRecord
    has_many :addresses
    has_many :sf_favs
    accepts_nested_attributes_for :sf_favs
    has_many :funding_projects

    # has_many :created_funding_projects, :foreign_key => "fp_creator_id", :class_name => "FundingProject"
    # has_many :participated_funding_projects, :foreign_key => "fp_participant_id", :class_name => "FundingProject"
    # accepts_nested_attributes_for :created_funding_projects
    has_one :address
    accepts_nested_attributes_for :address
    has_many :pledges
    has_many :funding_projects, through: :pledges
    # TO DO: THROUGH FP_PARTICIPANT ALIAS
    has_many :ls_comments
    has_many :l_stories, through: :ls_comments
    # has_many :fp_comments
    # has_many :funding_projects, through: :fp_comments
    # TO DO: THROUGH FP_PARTICIPANT ALIAS
    # has_many :l_stories
    # TO DO: THROUGH LS_CREATOR ALIAS
    # has_many :ls_genres
    # TO DO: THROUGH LS_CREATOR ALIAS

    # has_many :ls_genres
    # has_many :ls_genres, through: :l_stories
    # AS A CONTRIBUTOR

    has_secure_password

    validates_presence_of :name
    validates_presence_of :password
    validates_presence_of :email
    validates_uniqueness_of :email

    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash[:info][:email]
        #starts with a request ... have to put request here this way bec. models don't do requests/anything to do with http
        where(:email => oauth_email).first_or_create do |user|
            #using .first as a way to recognize the record that's found by where; .find wouldn't work
            #because #where did that??? 
            #first_or_create_by do |user| passes local variables not already created(???) with user. to create and becomes part of the instantiation of that user
            #and is included in the object returned
            user.password = SecureRandom.hex
            #we do this to satisfy validations; it doesn't matter what we set as a password because the third-party password rules
            #sql ... where is select in sql and when a user with the email passed as self wasn't found then it made it an insert in sql
        end

    end


    # before_save :make_name_titlecase

# private

#     def make_name_titlecase
#         self.name = self.name.titlecase
#     end
end
