module ApplicationHelper
  def navigation
    [
        {name: 'Home', path: root_path, icon: 'home', sub_nav: [
            {name: 'Location & Schedule', path: map_path, icon: 'question_answer'},
            {name: 'Resources & FAQ', path: faq_path, icon: 'question_answer'},
        ]},
        {name: 'Manage', path: manage_path, icon: 'perm_data_setting', if_clause: current_user && current_user.is_admin},
    ]
  end
end
