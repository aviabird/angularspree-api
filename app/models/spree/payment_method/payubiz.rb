module Spree
  class PaymentMethod::Payubiz < PaymentMethod
    def source_required?
      false
    end
  end
end