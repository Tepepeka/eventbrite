class EventsController < ApplicationController

    before_action :set_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create]    

    def index
        @events = Event.all
        
    end

    def show
      @attendances = Attendance.all
    end

    def new
      @event = Event.new
    end
  
    def create
      @event = Event.new(event_params)
      @event.user = current_user
      
      if @event.save
        redirect_to @event, notice: "Event was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
    

    def edit
    end
  
    def update
      if @event.update(event_params)
        redirect_to @event, notice: "Event was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end    

    def destroy
        @event.destroy
        redirect_to root_path, status: :see_other, notice: "Event was successfully destroyed."
    end

    #######
    private
    #######

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description)
    end

end