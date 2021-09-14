class ApplicationController < ActionController::API
  include Dry::Monads[:result, :do]
end
