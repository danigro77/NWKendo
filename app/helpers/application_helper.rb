module ApplicationHelper
  def navigation
    [
        {name: 'Home', path: root_path, icon: 'home', sub_nav: [
            {name: 'Location', path: map_path, icon: 'question_answer'},
            {name: 'Schedule', path: schedule_path(Date.current), icon: 'question_answer'},
            {name: 'Resources & FAQ', path: material_path, icon: 'question_answer'},
        ]},
        {name: 'Manage', path: manage_path, icon: 'perm_data_setting', if_clause: current_user && current_user.is_admin},
    ]
  end

  def body_links
    {
        row_1: [
            {title: 'Dojo Info', path: manage_path, icon: 'dojo-icon'},
            {title: 'Resources & FAQ', path: material_path, icon: 'resources-icon'},
            {title: 'Contact Us', path: 'mailto:info@northwestkendo.com', icon: 'email-icon'},
        ],
        row_2: [
            {title: 'Practice Hours', path: schedule_path(Date.current), icon: 'date-range-white-icon',
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

  def default_images
    %w(https://farm5.staticflickr.com/4232/34885233234_14e7b14ed9_k.jpg
      https://farm5.staticflickr.com/4137/35726718105_bc6ba489f3_k.jpg
      https://farm5.staticflickr.com/4057/35686704636_536cd4e2df_k.jpg
      https://farm5.staticflickr.com/4283/34884756944_38f70f27d5_k.jpg
    )
  end

  def random_default_image
    default_images.sample
  end

  def days_map
    %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
  end
  def months_map
    %w(January February March April May June July August September October November December)
  end

  def get_days_list(daysString, options={})
    days = daysString.split(',')
    if options[:translate]
      days.map! do |item|
        days_map[item.to_i]
      end
    end
    if options[:return_string]
      days = days.join(', ')
    end
    days
  end

  def format_time()

  end
end
