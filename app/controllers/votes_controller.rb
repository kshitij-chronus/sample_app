class VotesController < ApplicationController
  before_filter :signed_in_user

  def create
    micropost = Micropost.find(params[:vote][:micropost_id])
    category = params[:vote][:category]
    if (category.to_i == Vote::Type::UPVOTE)
      current_user.upvote!(micropost.id)
    else
      current_user.downvote!(micropost.id)
    end
    respond_to do |format|
       format.html { redirect_to root_path }
       format.js
    end
  end

  def destroy
    micropost = Micropost.find(params[:vote][:micropost_id])
    category = params[:vote][:category]
    if (category.to_i == Vote::Type::UPVOTE)
      current_user.unupvote!(micropost.id)
    else
      current_user.undownvote!(micropost.id)
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end