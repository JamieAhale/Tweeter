class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        like = tweet.likes.new(user: current_user)
        if like.save
            redirect_to tweets_path, notice: 'Tweet liked!'
        else
            redirect_to tweets_path, alert: 'You have already liked this tweet'
        end
    end

    def destroy
        like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)

        like.destroy
        redirect_to tweets_path, notice: 'Tweet unliked'
    end

end
