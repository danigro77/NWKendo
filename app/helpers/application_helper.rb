module ApplicationHelper
  def navigation
    [
        {name: 'Home', path: root_path},
        {name: 'Manage', path: manage_path, if_clause: current_user && current_user.is_admin},
    ]
  end
end
