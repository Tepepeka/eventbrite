class AttendancesController < ApplicationController

    def index
        @attendances = Attendance.all
        @event = Event.find(params[:event_id])  
    end

    def new
        @attendance = Attendance.new
        @user=current_user
        @event = Event.find(params[:event_id])
        @amount = @event.price
        @stripe_amount = (@amount * 100).to_i
    end

    def create
        @user=current_user
        @event= Event.find(params[:event_id])
        @amount = @event.price
        @stripe_amount = (@amount * 100).to_i

        # Before the rescue, at the beginning of the method
        begin
            customer = Stripe::Customer.create({
                email: params[:stripeEmail],
                source: params[:stripeToken],
                })  
            charge = Stripe::Charge.create({
                customer: customer.id,
                amount: @stripe_amount,
                description: "Pay for event",
                currency: 'usd',
                })

        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to event_path(@event.id)
        end
        # After the rescue, if the payment succeeded
        Attendance.create(stripe_customer_id:params[:stripeToken],user_id:@user.id,event_id:@event.id)
    end
   
end


