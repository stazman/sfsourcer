
# author_1 = LitFanAuthor.create!(name: "Frank Herbert")

ls_user = LsUser.create!(username: "Funky Fred")
ls_1 = LStory.create!(title: "From the Basement", content: "I heard a noise from the basement")
ls_2 = LStory.create!(title: "You, Robot", content: "Why is there a robot eating my foot, I wondered")
lsc_1 = LsComment.create!(content: "ghost!", ls_user_id: 1, l_story_id: 1)
wg_1 = WriterGroup.create!(wg_creator: "Christopher DiStasio", wg_name: "Science-Fantasy", wg_description: "We look forward to helping each other improve our writing in a friendly, productive environment. The work of writers in this section tend to have elements of both hard science fiction and fantasy.")
# b_fp = FundingProject.create!(title: "Test Fp", description: "test", funding_goal: "200")
# a_fpcreator = FpCreator.create!(creator_name: "ac", location: "tampa")
# # a_pledge = Pledge.create(amount: 20)
# a_backer = FpBacker.create!(name: "a", backer_email: "a@a.com")
b_pledge = Pledge.create!(amount: 10, funding_project_id: 1, fp_backer_id: 1)

# work1 = LitFanWork.create!(title: "Dune")
# genre1 = LitFanGenre.create!(name: "Science Fiction")

wg_work1 = WgWork.create!(author: "test", bio: "test", title: "test", version: "1", content: "a", writer_group_id: 1)

wg_comment1 = WgComment.create!(author: "Test commenter", content: "Test content", wg_work_id: 2)
wg_commentpre1 = WgComment.create!(author: "Test commenter pre", content: "Test content pre", wg_work_id: 1)

test_event1 = Event.new(title: "Test Event 1", description: "This event will feature several famous writers.", location: "Event Center, San Dimas, California", date: "July 20, 2019", start_time: "3 p.m.", cost: "$10", contact_info: "John James, organizer, 555-555-5555")