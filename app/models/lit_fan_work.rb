class LitFanWork < ApplicationRecord
    belongs_to :lit_fan_author
    # , optional: true
    has_many :lit_fan_work_lit_fan_genres
    has_many :lit_fan_genres, through: :lit_fan_work_lit_fan_genres
    accepts_nested_attributes_for :lit_fan_genres

    # validates_presence_of :lit_fan_work
    # validates_uniqueness_of :lit_fan_genre
    # validates_uniqueness_of :lit_fan_author


    # , reject_if: :rejectable?
    # proc { |attributes| attributes["name"].blank? }  

    # :all_blank, allow_destroy: 

    def lit_fan_author_name
        self.try(:lit_fan_author).try(:name)
    end
    # but how does this work from just the parameters??? what mechanism takes what instance through the strong params and how does it do it?
    def lit_fan_author_name=(name)
        lit_fan_author = LitFanAuthor.find_or_create_by(name: name)
        self.lit_fan_author = lit_fan_author
    end

    def lit_fan_genres_attributes=(lit_fan_genre_attributes)  
        lit_fan_genre_attributes.values.each do |lfg_attribute| 
        lfg = LitFanGenre.find_or_create_by(lfg_attribute)
        # unless lfg_attribute.blank?
        #  unless lfg_attribute.name.blank?  
        self.lit_fan_genres << lfg  
        end 
    end
end