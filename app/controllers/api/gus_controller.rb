module Api
  class GusController < ApplicationController
    def index
      gus = Gu.all.order('count desc')

      render json: gus, adapter: :json, each_serializer: GuSerializer
    end
  end
end
