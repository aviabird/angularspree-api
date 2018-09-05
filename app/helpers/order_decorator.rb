# frozen_string_literal: true

Spree::Core::ControllerHelpers::Order.module_eval do
  def set_current_order
    return unless try_spree_current_user

    # Find order by guest token and assign him logged in user when signs in
    guest_order = Spree::Order
                  .find_by(guest_token: request.headers['Guest-Order-Token'])
                  &.associate_user!(try_spree_current_user)

    user_order = current_order || guest_order

    return unless user_order

    incomplete_orders = try_spree_current_user
                        .orders
                        .incomplete
                        .where('id != ?', user_order.id)

    incomplete_orders
      .each { |order| user_order.merge!(order, try_spree_current_user) }
  end
end
