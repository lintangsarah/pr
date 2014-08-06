class PostsController < ApplicationController
	def new
		@post= Post.new
	end
	def create
		@post = Post.new(params.require(:post).permit(:name, :longitude, :latitude))
		if @post.save

			redirect_to posts_index_path, 
			notice: 'success'
		else
			render :new
		end
	end
	def index
		@post = Post.all
		respond_to do |format|
			format.html
			format.json {render json: @post }
			format.xml {render xml: @post }
		end
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		@post.update(params.require(:post).
			permit(:name,
				:longitude,
				:latitude,))
		redirect_to root_path
	end
	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to root_path
	end
end
