class LitFanAuthor < ApplicationRecord
    has_many :lit_fan_works

    validates_presence_of :lit_fan_work
    validates_uniqueness_of :lit_fan_work
    
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