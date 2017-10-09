require 'random_data'
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

	10.times do
		
		SponsoredPost.create!(
			topic: topics.sample,
			title: RandomData.random_sentence,
			body:	 RandomData.random_paragraph
	)
	end
 # Create Posts
 50.times do

   Post.create!(
    topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

100.times do
	Question.create!(
		title: RandomData.random_sentence,
		body:  RandomData.random_paragraph,
		resolved: false
	)
end
 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{SponsoredPost.count} Sponsered posts created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
	puts "#{Question.count} questions created"

 unique_post = Post.find_or_create_by!(title: "The Sky", body: "Why is the sky blue?")
 Comment.find_or_create_by!(post: unique_post, body: "The sky is an ocean.")
