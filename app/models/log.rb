class Log
  include Mongoid::Document
  include Mongoid::Timestamps

  field :message, type: String
  field :intent, type: String
  field :confidence, type: BigDecimal
  field :response, type: String
end
