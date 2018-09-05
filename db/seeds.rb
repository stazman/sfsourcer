user_1 = User.create!(name: "a", email: "a@a.com", password: "Aa123!")

author_1 = LitFanAuthor.create!(name: "Frank Herbert")

ls_user = LsUser.create!(username: "Funky Fred")
ls_1 = LStory.create!(title: "From the Basement", content: "I heard a noise from the basement")
lsc_1 = LsComment.create!(content: "ghost!", ls_user_id: 1, l_story_id: 1)
# # b_fp = FundingProject.create!(title: "Test Fp", description: "test", funding_goal: "200")
# # a_fpcreator = FpCreator.create!(creator_name: "ac", location: "tampa")
# # # a_pledge = Pledge.create(amount: 20)
# # a_backer = FpBacker.create!(name: "a", backer_email: "a@a.com")
# b_pledge = Pledge.create!(amount: 10, funding_project_id: 1, fp_backer_id: 1)

# work1 = LitFanWork.create!(title: "Dune")
# genre1 = LitFanGenre.create!(name: "Science Fiction")

