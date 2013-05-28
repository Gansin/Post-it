class PostsController < ApplicationController
# for example: the following code will prevent people from going to a specific webpage by typing into the address bar
before_filter :require_user, only: [:new, :create, :edit]
# Because we want only logged in users to be able create a new post

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    # @comment = @post.comments.build # creating a new in memory comment
    @comment = Comment.new

  end

  # new post form
  def new
  	@post = Post.new
  end

  # submission of the post form
  def create
  	# create the post
  	# the following is the short version of getting data
  	@post = Post.new(params[:post])
  	# the following is the long version of getting data
  	# @post = Post.new(params[:title], params[:url], params[:description])
  	# @post.user_id = 1 #TODO: add in real user after we have authentication
    # @post.user_id = current_user.id
    @post.user_id = session[:user_id]
  	if @post.save
  		flash[:notice] = "Post was created!"
  		redirect_to posts_path  # "/posts/#{@post_id}"
  	else # validation failure
      render :new
    end
  end

def edit
	@post = Post.find(params[:id])
  # binding.pry
  if session[:user_id] == @post.user_id
    render :edit
  else
    flash[:notice] = "You cannot edit someone else's Posts!"
    redirect_to post_path(@post)
  end
end

def update
	@post = Post.find(params[:id])
	if @post.update_attributes(params[:post])
 		flash[:notice] = "Post was updated!"
    @posts = Post.all
 	#	redirect_to "/posts/#{@post_id}"
  #  post = 1
   # redirect_to posts_path(@post)
   redirect_to @post
 	else #validation failure
    render :edit
 	end
 end

def vote
#binding.pry
  post = Post.find(params[:id])
  Vote.create(voteable: post, user: current_user, vote: params[:vote])

  flash[:notice] = "Your vote was counted!"
  redirect_to posts_path
end



end

