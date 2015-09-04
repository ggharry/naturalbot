module Api
  module V1
    class IntentsController < ApplicationController
      def index
        access_token = ENV['WIT_SERVER_ACCESS_TOKEN']

        render json: list_all_intents(access_token)
      end

      def show
        access_token = ENV['WIT_SERVER_ACCESS_TOKEN']
        intent_wit_id = params[:id]

        render json: get_single_intent(access_token, intent_wit_id)
      end

      private

        def list_all_intents(access_token)
          require 'open-uri'

          url = "https://api.wit.ai/intents"
          query = "?"
          query += "access_token=#{access_token}"

          url_data = open(url+query).read
        end

        def get_single_intent(access_token, intent_wit_id)
          require 'open-uri'

          url = "https://api.wit.ai/intents/#{intent_wit_id}"
          query = "?"
          query += "access_token=#{access_token}"

          url_data = open(url+query).read
        end
    end
  end
end
