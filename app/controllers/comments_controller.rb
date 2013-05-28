class CommentsController < ApplicationController

# use before_filter if you want the particular method before all other actions
# if you only have one action you want to execute before then use: before_filter : require_user, only: [:create]
# the "only:" is the key 
	before_filter :require_user

def show
	@post = Post.find(params[:post_id])
	# @comment = @post.comments.find(params[:id])
	@comment = @post.comments.build
end

def new
	#binding.pry
	@post = Post.find(params[:post_id])
	# binding.pry
	# @comment = @post.comments.new(params[:comment])
	@comment = @post.comments.new
end


 def create
 	#binding.pry
 #	@post = Post.find(params[:post_id])
 #	@comment = @post.comments.new(params[:comment])
 	# @comment.user_id = 1 # TODO set user after we have authentication
 	# @comment.post = @post
 	# @comment.user_id = current_user.id
 	@comment = Comment.new(params[:comment])
 	@comment.user_id = session[:user_id]
 	@comment.post_id = params[:post_id]
 	@post = Post.find(params[:post_id])

 	if @comment.save
 		flash[:notice] = "Comment created"
 		redirect_to post_path(@post)
 	else
 		render 'posts/show'
 	end  # end if-else
 end #end the def

 def destroy
 	@post = Post.find(params[:post_id])
 	@comment = Comment.find(params[:id])
 	comment.destroy
 	flash[:notice] = "Comment deleted!"
 	redirect_to post_path(@post)
 end
end