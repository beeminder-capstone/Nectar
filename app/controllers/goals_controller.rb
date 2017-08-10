=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class GoalsController < AuthenticatedController
  helper_method def goal
    @_goal ||= GoalDecorator.new(init_goal || raise(ActiveRecord::RecordNotFound))
  end

  helper_method def provider
    @_provider ||= PROVIDERS[params_provider_name]
  end

  helper_method def metric
    @_metric ||= provider&.find_metric(params_metric_key)
  end

  helper_method def credential
    @_credential ||= current_user.credentials.where(provider_name: provider.name).first
  end

  helper_method def available_goal_slugs
    @_availabe_goal_slugs ||= (
      current_user.client.goals.map(&:slug) -
      current_user.goals.pluck(:slug) +
      [goal.slug]
    ).compact
  end
  
  helper_method def available_types
    @_available_types = [:fatloser, :hustler, :biker, :inboxer, :gainer, :drinker]
  end
  
  helper_method def pledge_rates
    @_pledge_rates = [:y, :m, :w, :d, :h]
  end
  
  def new
    edit
  end

  def edit
    if credential.nil?
      redirect_to new_credential_path(provider_name: provider.name)
    else
      render :edit
    end
  end

  def create
    if goal.update_attributes goal_params
      redirect_to root_path, notice: "Goal created successfully for #{provider.name}!"
    else
      flash[:error] = goal.errors.full_messages.join(" ")
      redirect_to :back
    end
  end
  
  def update
    if goal.update_attributes goal_params
      redirect_to root_path, notice: "Goal updated successfully for #{provider.name}!"
    else
      flash[:error] = goal.errors.full_messages.join(" ")
      redirect_to :back
    end
  end

  def destroy
    goal.destroy!
    redirect_to root_path, notice: "Goal deleted successfully."
  end

  def reload
    BeeminderWorker.new.perform(beeminder_user_id: current_user.beeminder_user_id)
    redirect_to root_path, notice: "Scores updated."
  end

  private

  def init_goal
    (g_id = params[:id]) && current_user.goals.where(id: g_id).first ||
      credential.goals.build(metric_key: metric.key)
  end

  def goal_params
    slug_keys = params.dig("goal", "params", "source_slugs")&.keys
    params.require(:goal)
          .permit(:id, :slug, :params, :active, :new_goal,
                  params: [
                    :exponent, :timezone, :bed_time_hour, :bed_time_minute, :title, :type, :rate, :gunits, :runits,
                    list_ids: [],
                    source_slugs: slug_keys
                  ])
  end
  
  def params_provider_name
    params[:provider_name] || (params[:goal] || {})[:provider_name]
  end
  
  def params_metric_key
    params[:metric_key] || (params[:goal] || {})[:metric_key]
  end
end
