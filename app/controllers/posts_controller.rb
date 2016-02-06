class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
	end
	def new
		@post = Post.new
	end
	# just for git purpose
	def create
		@posts = Post.new(post_params)
		if @post.save
		redirect_to @post
	else
		render "new"
	end
	def show
		@post = Post.find(params[:id])
	end
	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
end
