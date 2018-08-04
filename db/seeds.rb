a = User.create(name: "a", email: "a@a.com", password: "a")
# aa fantastic_cats = FundingProject.create(creator_name: "Frank J Inc.", title: "Fantastic Cats", description: "A collection of short stories about cats with science fiction and fantasy settings.", funding_goal: 500, user_id: 1)
# frank_jones_cats_pledge = Pledge.create(amount: 10, user_id: 1, funding_project_id: 1)
aa = Address.create(address1: "100 Main Street", city: "Springfield", state: "Ohio", zip: "45454", user_id: 1)

work1 = LitFanWork.create(title: "Dune")
author1 = LitFanAuthor.create(name: "Frank Herbert")
genre1 = LitFanGenre.create(name: "Classic Science Fiction")
