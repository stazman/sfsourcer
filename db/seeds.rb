author_1 = LitFanAuthor.create!(name: "Frank Herbert")
work1 = LitFanWork.create!(title: "Dune", lit_fan_author_id: 1)
genre1 = LitFanGenre.create!(name: "Science Fiction")

ls_user = LsUser.create!(username: "Funky Fred")

ls_1 = LStory.create!(title: "From the Basement", content: "I heard a noise from the basement.xzd")

lsc_1 = LsComment.create!(content: "They came from Cleveland.", ls_user_id: 1, l_story_id: 1)

funding_project_1 = FundingProject.create!(title: "Test Funding Project 1", description: "This is Test Funding Project 1. A funding project has many pledges.", funding_goal: 200)

pledge1 = Pledge.create!(amount: 10, funding_project_id: 1, fp_backer_id: 1)

wg_1 = WriterGroup.create!(wg_creator: "Christopher DiStasio", wg_name: "Science-Fantasy", wg_description: "We look forward to helping each other improve our writing in a friendly, productive environment. The work of writers in this section tend to have elements of both hard 
science fiction and fantasy.")

wg_work1 = WgWork.create!(author: "test", bio: "test", title: "test", version: "1", content: "a", writer_group_id: 1)


wg_comment1 = WgComment.create!(author: "Test commenter 1", content: "Test content 1", wg_work_id: 1)

wg_comment2 = WgComment.create!(author: "Test commenter 2", content: "Test content 2", wg_work_id: 1)

test_event1 = Event.new(title: "Test Event 1", description: "This event will feature several famous writers.", location: "Event Center, San Dimas, California", date: "July 20, 2019", start_time: "3 p.m.", cost: "$10", contact_info: "John James, organizer, 555-555-5555")