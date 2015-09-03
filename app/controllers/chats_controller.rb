class ChatsController < ApplicationController
  def ask
    require 'wit'
    require 'json'

    access_token = ENV['WIT_SERVER_ACCESS_TOKEN']

    user_query = params[:message]

    Wit.init
    response = Wit.text_query user_query, access_token
    outcomes = JSON.parse(response)["outcomes"][0]
    intent = outcomes["intent"]
    confidence = outcomes["confidence"]
    Wit.close

    response = Response.where(intent: intent).first.response

    render json: {
      user_query: user_query,
      intent: intent,
      confidence: confidence,
      response: response
    }, status: 200
  end
end
