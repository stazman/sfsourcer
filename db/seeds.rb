a = User.create!(name: "a", email: "a@a.com", password: "a", sf_favs_attributes: [fav_lits: "left blank", fav_films: "left blank", fav_games: "left blank"])
# # b_fp = FundingProject.create!(title: "Test Fp", description: "test", funding_goal: "200")
# # a_fpcreator = FpCreator.create!(creator_name: "ac", location: "tampa")
# # # a_pledge = Pledge.create(amount: 20)
# # a_backer = FpBacker.create!(name: "a", backer_email: "a@a.com")
# b_pledge = Pledge.create!(amount: 10, funding_project_id: 1, fp_backer_id: 1)

author1 = LitFanAuthor.create!(name: "Frank Herbert")
genre1 = LitFanGenre.create!(name: "Classic Science Fiction")
work1 = LitFanWork.create!(title: "Dune")


