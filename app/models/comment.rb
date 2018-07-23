class Comment < ApplicationRecord
    # belongs_to :user
    belongs_to :funding_project

    # def comment_attributes=(comment)
    #     self.funding_project = FundingProject.find_by(name: artist.name)
    #     self.artist.update(artist)
    # end

end
