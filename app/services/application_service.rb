class ApplicationService
  include Callee
  include Dry::Monads[:result, :do]
end
