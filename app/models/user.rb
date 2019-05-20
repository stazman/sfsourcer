class User < ApplicationRecord
  
    has_secure_password

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :password

    EMAIL_REGEX = /(?!.*@.*@)+[a-z0-9A-Z!#^$%&'*+-\/=?_`{|}~;]+@+([A-Za-z0-9])+\.+(?=[a-zA-Z][a-zA-Z])/
   
    validates :email,
                uniqueness: true,
                :format => EMAIL_REGEX

    PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,36}\z/        
        validates :password, 
                    :format => PASSWORD_REGEX
                    
    def self.find_or_create_with_omniauth(auth)
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