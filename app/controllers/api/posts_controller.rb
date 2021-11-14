module Api
  class PostsController < ApplicationController
    before_action :post, only: [:destroy]
    def index
      posts = Post.all

      render json: posts, adapter: :json, each_serializer: CompanySerializer
    end

    def create
      post = Post.new(post_params)
      post.user = current_user
      if post.save
        render json: post, status: :created, serializer: PostSerializer
      else
        raise Exceptions::BadRequest, message: post.errors.full_messages.first
      end
    end

    def destroy
      if @post.destroy
        render status: :ok
      else
        raise Exceptions::BadRequest, message: @post.errors.full_messages.first
      end
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end

    def post
      @post ||= Post.where(user: current_user).find(params[:id])
    end
  end
end
