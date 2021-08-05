class UsersController < ApplicationController
  def show
    @created_events = current_user.created_events
    @upcoming_events = current_user.attend_events.future_events
    @past_events = current_user.attend_events.past_events
  end
end
