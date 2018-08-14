# a = User.create!(name: "a", email: "a@a.com", password: "a")
# b_fp = FundingProject.create!(title: "Test Fp", description: "test", funding_goal: "200")
# a_fpcreator = FpCreator.create!(creator_name: "ac", location: "tampa")
# # a_pledge = Pledge.create(amount: 20)
# a_backer = FpBacker.create!(name: "a", backer_email: "a@a.com")
b_pledge = Pledge.create!(amount: 10, funding_project_id: 1, fp_backer_id: 1)

# author1 = LitFanAuthor.create(name: "Frank Herbert")
# genre1 = LitFanGenre.create!(name: "Classic Science Fiction")
# work1 = LitFanWork.create!(title: "Dune")


dick = LitFanAuthor.create(name: "Phillip K. Dick")
philos_fiction = LitFanGenre.create!(name: "Philosophical Fiction", lit_fan_work_id: 6)
s_fic = LitFanGenre.create!(name: "Science Fiction")
android_sheep = LitFanWork.create!(title: "Do Androids Dream of Electric Sheep?", genre_ids: [1,6,7])

