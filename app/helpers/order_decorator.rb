# frozen_string_literal: true

Spree::Core::ControllerHelpers::Order.module_eval do
  def set_current_order
    return unless try_spree_current_user

    # Find order by guest token and assign him logged in user when signs in
    Spree::Order
      .find_by(guest_token: request.headers['Guest-Order-Token'])
      &.associate_user!(try_spree_current_user)

    incomplete_orders = try_spree_current_user
                        .orders
                        .incomplete
                        .where('id != ?', current_order.id)

    incomplete_orders
      .each { |order| current_order.merge!(order, try_spree_current_user) }
  end
end
