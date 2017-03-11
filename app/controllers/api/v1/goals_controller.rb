class Api::V1::GoalsController < Api::V1::BaseController

  def create
    user = User.find_by beeminder_user_id: params[:username]
	
	if user
	  goal = user.goals.new(goal_params)
      return api_error(status: 422, errors: goal.errors) unless goal.valid?

      goal.save!
	  
	  render(
        json: Api::V1::GoalSerializer.new(goal).to_json,
        status: 201
      )
	else
	  unauthenticated!
	end
  end
  
  def update
    user = User.find_by beeminder_user_id: params[:username]
	
	if user
	  goal = user.goals.find(params[:id])

      if !goal.update_attributes(goal_params)
        return api_error(status: 422, errors: goal.errors)
      end

      render(
        json: Api::V1::GoalSerializer.new(goal).to_json,
        status: 200
      )
	else
	  unauthenticated!
	end
  end
  
  private
  def goal_params
    slug_keys = params.dig("goal", "params", "source_slugs")&.keys
    params.permit(:id, :slug, :params, :active, :credential_id, :metric_key,
                  params: [
                    :exponent, :timezone, :bed_time_hour, :bed_time_minute,
                    list_ids: [],
                    source_slugs: slug_keys
                  ])
  end
end
