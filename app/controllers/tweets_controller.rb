class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @tweets = Tweet.all.order(created_at: :desc) # 全てのツイートを新しい順に取得
    # タグでの絞り込み検索のロジック（これはこのままでOK）
    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_tweets = Tag.find_by(name: key).tweets
          @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
        end
      end
    end
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path, notice: '投稿が完了しました。'
    else
      render :new
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path(tweet.id), notice: '投稿を更新しました。'
    else
      render :edit
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path, notice: '投稿を削除しました。'
  end
  def list
    @tweets = Tweet.all.order(created_at: :desc) # 全てのツイートを新しい順に取得
    # タグでの絞り込み検索のロジック（これはこのままでOK）
    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_tweets = Tag.find_by(name: key).tweets
          @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
        end
      end
    end
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end
  private
  # private の下には、この tweet_params だけを記述します
  def tweet_params
    # チェックボックスから送られてくる tag_ids を配列として許可します
    params.require(:tweet).permit(:name, :price, :detail, :image, tag_ids: [])
  end
end














