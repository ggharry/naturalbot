module Api
  module V1
    class ResponsesController < ApplicationController
      def index
        intent_name = params[:intent_name]

        responses = Response.where(intent: intent_name)

        render json: responses
      end
    end
  end
end
