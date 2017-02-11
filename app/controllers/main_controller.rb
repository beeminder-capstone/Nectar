class MainController < ApplicationController
  helper_method def goals
    @_goals ||= current_user&.goals&.map(&GoalDecorator.method(:new))
  end
end
