require 'redmine'
require 'planner/hooks'

Redmine::Plugin.register :planner do
  name 'Planner plugin'
  author 'Daniel Ritz'
  description 'Redmine Resource Planner Plugin'
  version '0.0.1'
  url 'http://github.com/dr-itz/RedminePlannerPlugin'
  author_url 'mailto:daniel.ritz@gmx.ch'
  requires_redmine :version_or_higher => '2.0.3'

  project_module :planner do
    permission :planner_view, {
      :planner => :index,
      :plan_groups => [:index, :show],
      :plan_tasks => [:index, :show],
      :plan_requests => [:index, :show],
      :plan_details => [:index, :show]
    }

    permission :planner_requests, {
      :plan_requests => [
        :new, :create, :edit, :update, :destroy, :send_request, :approve],
      :plan_details => [:index, :create, :destroy]
    }

    permission :planner_task_create, {
      :plan_tasks => [:new, :create, :edit, :update]
    }

    permission :planner_admin, {
      :planner => :index,
      :plan_groups => [
        :index, :show, :new, :create, :edit, :update, :destroy,
        :remove_membership, :add_membership
      ],
      :plan_tasks => [
        :index, :show, :new, :create, :edit, :update, :destroy],
      :plan_requests => [
        :index, :show, :new, :create, :edit, :update, :destroy, :send_request, :approve],
      :plan_details => [:index, :create, :destroy]
    }
  end

  menu :project_menu, :planner,
    { :controller => 'planner', :action => 'index' },
    :caption => :label_planner_menu_main, :param => :project_id
end
