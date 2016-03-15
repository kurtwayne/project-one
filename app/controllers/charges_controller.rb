class ChargesController < ApplicationController
  def create
    # Amount in cents
    @amount = 1500

    #Creates a Stripe Customer object, for associating with the Charge
    customer = Stripe::Customer.creat(
      email: current_user.email,
      card: params[:stripeToken]
    )

    #Where the real magic happens
    charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is not user_id
    amount: @amount,
    description: "BigMoney Membership - #{current_user.email}",
    currency: 'usd'
    )

    flash[:notice] = "Thanks for yo cash money, #{current_user.email}!  Feel free to pay me again."
    redirect_to user_path(current_user)
end

# Stripe will send back CardErrors, with friendly messages when something goes wrong.
# This 'rescue block' catches and displays those errors.
rescue Stripe::CardError => e
  flash.now[:alert] = e.message
  redirect_to new_charge_path
end

def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "BigMoney Membership - #{current_user.name}",
    amount: @amount
  }
end
