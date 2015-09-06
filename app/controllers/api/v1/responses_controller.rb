module Api
  module V1
    class ResponsesController < ApplicationController
      def index
        intent_name = params[:intent_name]

        responses = Response.where(intent: intent_name)

        render json: responses
      end

      def create
        intent_name = params[:intent_name]

        response = Response.new(response_params)
        response.intent = intent_name

        if response.save
          render json: response
        else

        end
      end

      def destroy
        response = Response.find(params[:id])

        if response
          if response.destroy
            render json: { message: "Response deleted" }, status: :no_content
          else
          end
        else
        end
      end

      private

        def response_params
          params.require(:response).permit(:response)
        end
    end
  end
end
