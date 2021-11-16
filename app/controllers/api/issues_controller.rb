module Api
  class IssuesController < ApplicationController
    before_action :issue, only: [:show]

    def index
      ids = []
      query = {
        query: params[:query]
      }
      headers = {
        "X-Naver-Client-Id" => Rails.application.credentials.naver_id || ENV['NAVER_ID'],
        "X-Naver-Client-Secret"  => Rails.application.credentials.naver_secret || ENV['NAVER_SECRET']
      }

      response = HTTParty.get(
        "https://openapi.naver.com/v1/search/news.json",
        :query => query,
        :headers => headers
      )

      response['items'].each do |r|
        issues = Issue.where(link: r['link'])
        if issues.present?
          ids.push(issues.first.id)
          next
        else
          issue = Issue.create(title: r['title'], original_link: r['originallink'], link: r['link'], description: r['description'])
          ids.push(issue.id)
        end
      end
      issues = Issue.where(id: ids)

      render json: issues, adapter: :json, each_serializer: IssueSerializer
    end

    def show
      @issue.view_count = @issue.view_count + 1
      @issue.save

      render json: :ok, status: :ok
    end

    private

    def issue
      @issue = Issue.find params[:id]
    end
  end
end
