require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
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
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

 unique_post = Post.find_or_create_by!(title: "The Sky", body: "Why is the sky blue?")
 Comment.find_or_create_by!(post: unique_post, body: "The sky is an ocean.")