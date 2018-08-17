class LitFanAuthor < ApplicationRecord
    has_many :lit_fan_works

    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          all
        end
    end

    def self.alphabetized
      # all.order('name').first
      all.order("name")

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
