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

      # joins(:lit_fan_works).group("lit_fan_author.id").order(title: :desc).limit(1)
      # binding.pry
      
      # having("COUNT(*) = 3").select("boats.*")
      # select authors where there are works
      # order the authors by most works asc limit 1 
    end


    # def self.most_works
    #   self.lit_fan_works.sort.last
    # end
end
