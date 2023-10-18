class TweetsController < ApplicationController

    def index
        # Test
        @tweets = Tweet.includes(:user).all
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def create
        @tweet = current_user.tweets.build(tweet_params)
            if @tweet.save

                redirect_to tweets_path
                flash[:notice] = "Thanks for posting!"
            else
                render '_new'
            end
    end

    def edit
        @tweet = Tweet.find(params[:id]) 
    end

    def update 
        @tweet = current_user.tweets.find(params[:id])
        if @tweet.update(tweet_params)
            redirect_to @tweet, notice: 'Tweet has been successfully edited.'
        else
            render :edit
        end
    end

    def destroy
        @tweet = current_user.tweets.find(params[:id])
        @tweet.destroy
        redirect_to tweets_path, notice: 'Tweet was deleted'
    end


    private
    def tweet_params
        params.require(:tweet).permit(:content)
    end
    
end
