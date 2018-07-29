# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
frank_jones = User.create(name: "Frank Jones", email: "frankjones@yahoo.com", password: "frank jones password")
fantastic_cats = FundingProject.create(creator_name: "Frank J Inc.", title: "Fantastic Cats", description: "A collection of short stories about cats with science fiction and fantasy settings.", funding_goal: 500, user_id: 1)
# frank_jones_cats_pledge = Pledge.create(amount: 10, user_id: 1, funding_project_id: 1)
# frank_jones_address = Address.create(address1: "100 Main Street")
# new_story = LStory.create(title: "b", content: "b")
# new_genre = OGenre.create(name: "b")
