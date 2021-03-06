module Api
  class PostsController < ApplicationController
    before_action :post, only: [:destroy]
    def index
      posts = Post.where(gu: params[:gu])

      render json: posts, adapter: :json, each_serializer: PostSerializer
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
        render json: :ok, status: :ok
      else
        raise Exceptions::BadRequest, message: @post.errors.full_messages.first
      end
    end

    def user
      posts = current_user.posts

      render json: posts, adapter: :json, each_serializer: PostSerializer
    end

    private

    def post_params
      params.require(:post).permit(:content, :gu)
    end

    def post
      @post ||= Post.where(user: current_user).find(params[:id])
    end
  end
end
