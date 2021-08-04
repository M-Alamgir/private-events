module EventsHelper
  def attend_event
    if @event.attendees.exists?(current_user.id)
      'You are Attending'
    else
      link_to 'Attend this event', "/events/attend/#{@event.id}", method: :put,
                                                                  class: 'bg-red-500 list-none py-3 px-16 text-center text-white font-bold font-mono rounded'
    end
  end

  def attendee_list
    list = ''
    @event.attendees.each do |attendee|
      list << attendee.email[/[^@]+/] + '<br>'
    end
    list.html_safe
  end
end
