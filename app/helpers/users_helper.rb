module UsersHelper
  def start_stop_button
    work_session = current_user.work_sessions.last
    if !work_session || work_session.finish
      '<div id="start-finish">Start Work</div>'.html_safe
    else
      "<div id='start-finish' data-id='#{work_session.id}'>Finish Work</div>".html_safe
    end
  end

  def projects_dropdown
    select_tag :project, options_for_select(projects_array)
  end

  def projects_array
    current_user.projects.map { |p| [p.name, p.id] }
  end
end
