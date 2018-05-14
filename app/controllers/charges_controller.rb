class ChargesController < ApplicationController

  def create
   # Creates a Stripe Customer object, for associating
   # with the charge

   #amount in cents
   @amount = 1500
   @user = current_user

   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   @user.update!(user_premium)

   flash[:notice] = "Thanks for your purchase, #{current_user.email}!"
   redirect_to home_show_path(current_user) # or wherever

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.username}",
      amount: @amount
    }
  end

  private

  def user_premium
    @user.role = 1
    params.permit(:role)
  end
end
