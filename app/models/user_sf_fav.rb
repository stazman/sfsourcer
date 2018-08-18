class UserSfFav < ApplicationRecord
    belongs_to :user
    belongs_to :sf_fav
end