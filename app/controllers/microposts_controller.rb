class MicropostsController < ApplicationController
  before_filter :signed_in_user

  def new
    @micropost  = current_user.microposts.build
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Card created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost = Micropost.find(params[:id]) #added def'n for @micropost
    @micropost.destroy
    redirect_to root_url
  end


  def upvotes
    @title = "Upvotes"
    @user = User.find(params[:id])
    #@users = @user.followers.paginate(page: params[:page])
    render 'show_votes'
  end

  def downvotes
    @title = "Downvotes"
    @user = User.find(params[:id])
    #@users = @user.followers.paginate(page: params[:page])
    render 'show_votes'
  end

  private
  
    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end