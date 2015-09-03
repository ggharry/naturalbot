class Response
  include Mongoid::Document

  field :intent, type: String
  field :response, type: String
end
