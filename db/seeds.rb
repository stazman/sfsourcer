a = User.create!(name: "a", email: "a@a.com", password: "a")
b_fp = FundingProject.create!(title: "Test Fp", description: "test", funding_goal: "200")
a_fpcreator = FpCreator.create!(creator_name: "ac", location: "tampa")
# a_pledge = Pledge.create(amount: 20)
a_backer = FpBacker.create!(name: "a", backer_email: "a@a.com")

author1 = LitFanAuthor.create(name: "Frank Herbert")
genre1 = LitFanGenre.create!(name: "Classic Science Fiction")
work1 = LitFanWork.create!(title: "Dune")


