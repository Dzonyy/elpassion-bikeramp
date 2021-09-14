class ApplicationOperation
  include Callee
  include Dry::Monads[:result, :do]
end
