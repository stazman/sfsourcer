class User < ApplicationRecord
    has_many :funding_projects 
    # AS A CREATOR
    has_many :l_stories
    # AS A CREATOR
    has_many :ls_genres
    # AS A CREATOR  
    has_many :addresses
    # AS A USER
    has_many :pledges
    # AS A CONTRIBUTOR
    # has_many :funding_projects, through: :pledges
    # AS A CONTRIBUTOR
    has_many :fp_comments
    # AS A CONTRIBUTOR
    # has_many :funding_projects, through: :fp_comments
    # AS A CONTRIBUTOR
    has_many :l_stories
    # AS A CONTRIBUTOR
    has_many :ls_comments
    # AS A CONTRIBUTOR
    has_many  :l_stories, through: :ls_comments
    # AS A CONTRIBUTOR
    # accepts_nested_attributes_for :funding_projects

    # has_many :ls_genres, through: :l_stories
    # has_many :funding_projects
    # has_many :fp_creators
    # # has_many :funding_projects, through: :fp_creators
    # has_many :fp_comments
    # has_many :funding_projects, through: :fp_comments
    # , :class_name => 'Addresses', :foreign_key => 'user_id'
    # accepts_nested_attributes_for :addresses

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
