class CommentsController < ApplicationController
    before_action :find_tweet
    before_action :find_comment, only: [:destroy]

    def create
        @comment = @tweet.comments.new(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to @tweet
        else
            redirect_to tweets_path, notice: 'Comment failed to post'
        end
    end

    def destroy
        if @comment.user == current_user
            @comment.destroy
            redirect_to @tweet
        else
            redirect_to @tweet, notice: 'Comment failed to delete'
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end

    def find_tweet
        @tweet = Tweet.find(params[:tweet_id])
    end

    def find_comment
        @comment = @tweet.comments.find(params[:id])
    end


end
