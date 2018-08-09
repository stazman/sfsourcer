a = User.create(name: "a", email: "a@a.com", password: "a")
afp = FundingProject.create(title: "afp")
afpc = FpCreator.create(creator_name: "ac", location: "tampa")

# fpb = FpBacked.create
 
work1 = LitFanWork.create(title: "Dune")
author1 = LitFanAuthor.create(name: "Frank Herbert")
genre1 = LitFanGenre.create(name: "Classic Science Fiction")

# s = FpCreator.create(name: "s", user_id: 1)


