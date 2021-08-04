module EventsHelper
  def attend_event
    if @event.attendees.exists?(current_user.id)
      '<li class="bg-green-400 list-none py-2 text-center text-white
      font-bold font-mono rounded">You are Attending</li>'.html_safe
    else
      link_to 'Attend this Event', "/events/attend/#{@event.id}", method: :put,
                                                                  class:
                                                                  'bg-red-500 w-50 list-none py-3 px-16 text-center
      text-white font-bold font-mono rounded'
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
