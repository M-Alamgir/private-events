module EventsHelper
	def attend_event
		if !@event.attendees.exists?(current_user.id)
			link_to 'Attend this event', "/events/attend/#{@event.id}", method: :put
		else
			'Attending'
		end
	end

	def list_events(events)
		events_list = ''
		events.each do | event |
			time = event.time
			events_list << time.to_s
		end
		events_list
	end
end
