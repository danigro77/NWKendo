module ApplicationHelper
  def navigation
    [
        {name: 'Home', path: root_path, icon: 'home', sub_nav: [
            {name: 'Location', path: map_path, icon: 'question_answer'},
            {name: 'Schedule', path: schedule_path, icon: 'question_answer'},
            {name: 'Resources & FAQ', path: faq_path, icon: 'question_answer'},
        ]},
        {name: 'Manage', path: manage_path, icon: 'perm_data_setting', if_clause: current_user && current_user.is_admin},
    ]
  end

  def body_links
    {
        row_1: [
            {title: 'Dojo Info', path: manage_path, icon: 'dojo-icon'},
            {title: 'Resources & FAQ', path: faq_path, icon: 'resources-icon'},
            {title: 'Contact Us', path: 'mailto:daniela@email.com', icon: 'email-icon'},
        ],
        row_2: [
            {title: 'Practice Hours', path: schedule_path, icon: 'date-range-white-icon',
             info: ['6:30PM to 8:30PM', 'Every Wednesday and Friday']},
            {title: 'Find Us At', path: map_path, icon: 'location-white-icon',
             info: ['10510 5th Avenue NE, Seattle, WA 98125'],
             button: {text: 'Get directions'}},
            {title: 'First Time Visit', path: manage_path, icon: 'add-people-white-icon',
             info: ['Make sure you read this before your first visit']},
        ]
    }
  end

  def location_schedule
    {
        address: {
            locations: 'Northgate Community Center',
            street: '10510 5th Avenue NE',
            city: 'Seattle, WA, 98125',
            lat: 47.705457,
            lng: -122.322306
        },
        schedule: {
            days: 'Wednesday and Friday',
            times: '6:30 to 8:30pm'
        }
    }
  end
end
