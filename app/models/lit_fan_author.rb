class LitFanAuthor < ApplicationRecord
    has_many :lit_fan_works

    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          all
        end
    end
end
