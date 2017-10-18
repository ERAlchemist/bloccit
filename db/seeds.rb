require 'random_data'

# Create Users
 5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all
 # Create Posts
 50.times do

   Post.create!(
		user:  users.sample,
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

	# Create an admin user
  admin = User.create!(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
  
  # Create a member
  member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
  )
 
 puts "Seed finished"
  puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
	puts "#{Question.count} questions created"

 unique_post = Post.find_or_create_by!(title: "The Sky", body: "Why is the sky blue?")
 Comment.find_or_create_by!(post: unique_post, body: "The sky is an ocean.")
