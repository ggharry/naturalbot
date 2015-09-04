module Api
  module V1
    class ChatsController < ApplicationController
      def ask
        require 'json'

        access_token = ENV['WIT_SERVER_ACCESS_TOKEN']

        user_query = params[:message]

        response = get_intent user_query, access_token
        outcomes = JSON.parse(response)["outcomes"][0]
        intent = outcomes["intent"]
        confidence = outcomes["confidence"]

        response = Response.where(intent: intent).first.response

        Log.create(message: user_query, intent: intent, confidence: confidence, response: response)

        render json: {
          user_query: user_query,
          intent: intent,
          confidence: confidence,
          response: response
        }, status: 200
      end

      private

      def get_intent(message, access_token)
        require 'open-uri'

        url = "https://api.wit.ai/message?access_token=#{access_token}&q=#{message}"

        url_data = open(url).read
      end
    end
  end
end
