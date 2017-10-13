module ApplicationHelper
  def navigation
    [
        {name: 'Home', path: root_path},
        {name: 'Manage', path: manage_path, if_clause: current_admin, hide_sub_nav: true,
         sub_nav: [
            {name: 'Media', path: '#media'},
            {name: 'Footer', path: '#footer'},
        ]},
    ]
  end
end
