class HomepageController < ApplicationController

  #skip_before_action(:force_user_sign_in, { :only => [:index] })
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    the_username = params.fetch("path_id")
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "users/show.html.erb" })
  end

  def feed
    the_username = params.fetch("path_id")
    @user = User.where({ :username => the_username }).at(0)

    @followers = FollowRequest.where({:recipient => @user.id})
    
    #@following = FollowRequest.where({:sender => @user.id})

    render({ :template => "users/feed.html.erb"})
  end
end