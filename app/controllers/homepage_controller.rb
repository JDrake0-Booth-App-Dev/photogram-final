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
    #the_username = params.fetch("path_id")
    #@user = User.where({ :username => the_username }).at(0)

    #@followers = FollowRequest.where({:recipient => @user.id})

    @the_username = params.fetch("path_id")
    @matching_users = User.where({ :username => @the_username })
    @user = @matching_users.at(0)
    @the_user_id = @user.id
    @all_of_users_follow_requests = FollowRequest.where({ :recipient_id => @the_user_id })
    @users_accepted_follow_requests = @all_of_users_follow_requests.where({ :status => "accepted" })
    #@followers = FollowRequest.where({:recipient => @user.id}).at.(0).where({:status => accepted}).at(0)
    
    #@following = FollowRequest.where({:sender => @user.id})

    render({ :template => "users/feed.html.erb"})
  end

  def like
    the_username = params.fetch("path_id")
    @user = User.where({ :username => the_username }).at(0)

    @followers = FollowRequest.where({:recipient => @user.id})
    
    #@following = FollowRequest.where({:sender => @user.id})

    render({ :template => "users/feed.html.erb"})
  end

  def discover
    the_username = params.fetch("path_id")
    @user = User.where({ :username => the_username }).at(0)

    @followers = FollowRequest.where({:recipient => @user.id})
    
    #@following = FollowRequest.where({:sender => @user.id})

    render({ :template => "users/feed.html.erb"})
  end
end