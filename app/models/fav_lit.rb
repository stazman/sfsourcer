class FavLit < ApplicationRecord
    belongs_to :fav_author
    has_many :fav_lit_fav_genres    
    has_many :fav_genres, through: :fav_lit_fav_genres
    accepts_nested_attributes_for :fav_genres

    # def categories_attributes=(category_attributes)
    #     category_attributes.values.each do |category_attribute|
    #       category = Category.find_or_create_by(category_attribute)
    #       self.categories << category
    #     end 
    # end
end 
