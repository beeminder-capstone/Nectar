class Api::V1::UsersController < Api::V1::BaseController

  def show
    user = User.find_by beeminder_user_id: params[:username]
	
	if user
      render(json: Api::V1::UserSerializer.new(user).to_json)
	else
	  unauthenticated!
	end
  end
end
