class AttendeesController < ApplicationController
  
  def index
    @attendees      = Attendee.all(:order => 'geek_votes DESC')
    total_attendees = @attendees.count

    random_number_left  = rand(total_attendees) # olha o zero!!
    random_number_right = rand(total_attendees)

    @attendee_left  = Attendee.find(random_number_left)
    @attendee_right = Attendee.find(random_number_right)
  end  
  
  def create
    respond_to do |format|
      format.json do 
        Attendee.find(params[:attendee_id]).add_geek_vote
        render :json => {'text' => ''}
      end  
    end  
    
  end  
  
end
