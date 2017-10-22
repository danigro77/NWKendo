module ApplicationHelper
  def navigation
    [
        {name: 'Home', path: root_path},
        {name: 'Manage', path: manage_path, if_clause: current_admin},
    ]
  end
end
