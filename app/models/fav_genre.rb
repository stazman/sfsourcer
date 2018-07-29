class FavGenre < ApplicationRecord
    has_many :fav_lit_fav_genres    
    has_many :fav_lits, through: :fav_lit_fav_genres
end
