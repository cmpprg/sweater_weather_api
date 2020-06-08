class ErrorSerializer
  include FastJsonapi::ObjectSerializer

  set_id { |id| id = nil }

  attributes :message
end
