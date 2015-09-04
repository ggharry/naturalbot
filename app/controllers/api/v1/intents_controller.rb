module Api
  module V1
    class IntentsController < ApplicationController
      def index
        access_token = ENV['WIT_SERVER_ACCESS_TOKEN']

        render json: list_all_intent(access_token)
      end

      private

      def list_all_intent(access_token)
        require 'open-uri'

        url = "https://api.wit.ai/intents"
        query = "?"
        query += "access_token=#{access_token}"

        url_data = open(url+query).read
      end
    end
  end
end
