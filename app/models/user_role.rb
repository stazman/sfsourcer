class UserRole < ApplicationRecord
    has_many :user_user_roles
    has_many :users, through: :user_user_roles
    

    # ROLE WRITER -- ADMIN NAMESPACED
    # USER CHOOSES ROLES THAT THEN ASSOCIATE THEM THROUGH SETTERS/GETTERS 
    

    # FP_BACKER MODEL
    #     HAS MANY 
        
    # SETTERS GETTERS FOR
    #     # FUNDING PROJECT BACKER
    #     # FP_CREATOR
    #     # LS_CONTRIBUTOR/LS_CREATOR
    #     # FANVORITES CONTRIBUTOR
    #     # WRITING_GROUP_MENTOR/WRITING_GROUP_CONTRIBUTER
    #     # FAN_PAGE_CREATOR
    #     # EVENT_WIKI_CONTRIBUTOR

    #     # NOT COMMENTER ... HANDLED THROUGH POLYMORPHIC FOR ALL CLASSES THAT HAVE COMMENTERS/CHAT ROOM PARTICIPANTS/HOSTS
end
