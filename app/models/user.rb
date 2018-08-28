class User < ApplicationRecord

    has_secure_password

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :password

    PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{6,10}\z/
    
    validates :password, 
                    :format => PASSWORD_REGEX 
                    # request.env['omniauth.auth']
                    # request.path -> "/auth/facebook/callback"
                    
                    # the user is using facebook signup/login 

    # EMAIL_REGEX = /(?!.*@.*@)+[a-z0-9A-Z!#^$%&'*+-\/=?_`{|}~;]+@+([A-Za-z0-9])+.+[a-zA-Z][a-zA-Z]/
    validates :email,
                    uniqueness: true
                    # :format => EMAIL_REGEX

    def current_path
    end

    def self.create_with_omniauth(auth)
        user = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
        user.email = auth['info']['email']
        user.password = auth['uid']
        user.name = auth['info']['name']
        user.image = auth['info']['image']
        if User.exists?(user.id)
            user
        else
            user.save
            user
        end
    end
                
end

    # def self.find_or_create_by_omniauth(auth_hash)
    #     oauth_email = auth_hash[:info][:email]
    #     #starts with a request ... have to put request here this way bec. models don't do requests/anything to do with http
    #     where(:email => oauth_email).first_or_create do |user|
    #     #using .first as a way to recognize the record that's found by where; .find wouldn't work
    #     #because #where did that??? 
    #     #first_or_create_by do |user| passes local variables not already created(???) with user. to create and becomes part of the instantiation of that user
    #     #and is included in the object returned
    #     user.password = SecureRandom.hex
    #     #we do this to satisfy validations; it doesn't matter what we set as a password because the third-party password rules
    #     #sql ... where is select in sql and when a user with the email passed as self wasn't found then it made it an insert in sql
    #     end
    # end

    # def self.create_with_omniauth(auth)
    #     user = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
    #     user.email = "#{auth['uid']}@#{auth['provider']}.com"
    #     user.password = auth['uid']
    #     user.name = auth['info']['name']
    #     user.image = auth['info']['image']
    #     if User.exists?(user.id)
    #         # redirect_to root_url 
    #         user
    #     else
    #         user.save
    #         # redirect_to root_url 

    #         user
    #     end




    # has_many :user_sf_favs
    # has_many :sf_favs, through: :user_sf_favs
    # accepts_nested_attributes_for :sf_favs

    # has_many :user_user_roles
    # has_many :user_roles, through: :user_user_roles

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

    # has_many :user_fp_creators 
    # has_many :fp_creators, through: :user_fp_creators
    # connect through abstract queries
    # has_many :user_fp_backers
    # has_many :fp_backers, through: :user_fp_backers
    # this may be better as a has many but not has many through, maybe depending on polymorphic with only other classes involved such as comments
    # connect through abstract queries

    # def fp_backer_connect_id
    #     self.try(:fp_backer).try(:connect_id)
    # end
    # # but how does this work from just the parameters??? what mechanism takes what instance through the strong params and how does it do it?
    # def fp_backer_connect_id=(connect_id)
    #     fpb = FpBacker.find_or_create_by(:connect_id: connect_id)
    #     self.fp_backer = fpb
    # end
    # has_many :user_fp_backers
    # has_many :fp_backers, through: :user_fp_backers
