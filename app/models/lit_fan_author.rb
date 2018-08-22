class LitFanAuthor < ApplicationRecord
    has_many :lit_fan_works

    # validates_uniqueness_of :lit_fan_author
    
    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          all
        end
    end

    def self.alphabetized
      all.order(name: :asc)
    end
end