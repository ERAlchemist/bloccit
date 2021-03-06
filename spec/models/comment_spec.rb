require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:comment) { create(:comment) }
   
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }
  
  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: comment.body)
    end
  end

  describe "after_create" do
    before do
      @another_user = create(:user)
      @another_comment = Comment.new(body: 'Comment Body', post: post, user: @another_user)
    end
    it "sends an email to users who have favorited the post" do
      favorite = user.favorites.create(post: post)
      expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).at_least(:once).and_return(double(deliver_now: true))
      @another_comment.save!
    end
  end
end
