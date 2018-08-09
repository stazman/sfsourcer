class User < ApplicationRecord
    has_many :sf_favs
    accepts_nested_attributes_for :sf_favs
    has_many :user_user_roles
    has_many :user_roles, through: :user_user_roles
    # has_many :pledges
    # has_many :funding_projects, through: :pledges
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

    # def fp_creator_attributes=(fp_creator_attributes)
    #     fp_creator_attributes.values.each do |fpc_attribute|
    #     fpc = FpCreator.find_or_create_by(fpc_attribute) 
    #     self.fp_creators << fpc unless fpc.name == ""
    #     end 
    # end

    # before_save :make_name_titlecase

# private

#     def make_name_titlecase
#         self.name = self.name.titlecase
#     end
end
