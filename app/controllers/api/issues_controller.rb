module Api
  class IssuesController < ApplicationController

    def index
      issues = Issue.all

      render json: issues, adapter: :json, each_serializer: CompanySerializer
    end
  end
end
