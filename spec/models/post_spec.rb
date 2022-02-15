require 'rails_helper'

RSpec.describe Post, type: :model do
  context"Happy" do
    it "has a title" do 
     current_user=current_user()
      post = Post.new(
        title: "this is title",
        body: "This is sa new post",
        user_id: current_user.id,
        views: 0
      )
      expect(post).to be_valid
    end

    it "has a body" do 
     current_user=current_user()
      post = Post.new(
        title: "This is title",
        body: "this is body",
        user_id: current_user.id,
        views: 0
      )
      expect(post).to be_valid
    end
  end

  context"Sad" do
    describe "Title is not valid" do
      it "does not have a title" do 
       current_user=current_user()
        post = Post.new(
          title: "",
          body: "This is sa new post",
          user_id: current_user.id,
          views: 0
        )
        expect(post).to_not be_valid
      end
    end

    describe "minimum length of title should be 2" do
      it "title error" do 
       current_user=current_user()
        post = Post.new(
          title: "1",
          body: "This is sa new post",
          user_id: current_user.id,
          views: 0
        )
        expect(post).to_not be_valid
      end
    end

    describe "minimum length of body should be 5" do
      it "body length error" do 
       current_user=current_user()
        post = Post.new(
          title: "this is title",
          body: "post",
          user_id: current_user.id,
          views: 0
        )
        expect(post).to_not be_valid
      end
    end

    describe "maximum length of body can be 100" do
      it "body length error" do 
        hundred_char_string = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m'
       current_user=current_user()
        post = Post.new(
          title: "this is title",
          body: hundred_char_string + "1",
          user_id: current_user.id,
          views: 0
        )
        expect(post).to_not be_valid
      end
    end

    describe "body is not valid" do
      it "does not a body" do 
       current_user=current_user()
        post = Post.new(
          title: "This is title",
          body: "",
          user_id: current_user.id,
          views: 0
        )
        expect(post).to_not be_valid
      end
    end
  end

  def current_user
    User.first_or_create(email: "satynautiyal@gmail.com", password: "123456", password_confirmation: "123456")
  end
end
