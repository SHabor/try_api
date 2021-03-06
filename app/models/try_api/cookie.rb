module TryApi
  class Cookie < TryApi::Base
    typesafe_accessor :name, String
    typesafe_accessor :description, String
    typesafe_accessor :global, Boolean, default: false
  end
end