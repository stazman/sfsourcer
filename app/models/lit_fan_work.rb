class LitFanWork < ApplicationRecord
    belongs_to :lit_fan_author
    has_many :lit_fan_genres
    has_many :lit_fan_genres, through: :lit_fan_work_lit_fan_genres

        # but how does this work from just the paramaters???

    def lit_fan_author_name
        self.try(:lit_fan_author).try(:name)
    end
    # but how does this work from just the parameters??? what mechanism takes what instance through the strong params and how does it do it?
    def lit_fan_author_name=(name)
        lit_fan_author_name = LitFanAuthor.find_or_create_by(name: name)
        self.artist = artist
    end
end

