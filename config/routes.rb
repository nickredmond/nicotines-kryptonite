Rails.application.routes.draw do

  get 'dashboard/index'

  get 'dashboard/milestones'

  get 'dashboard/journal'

  get 'dashboard/whyquit'

  get 'story/index'

  get 'story/viewstory'

  get 'story/viewpage'

  root :to => 'home#index'

  get 'home/index'

  get 'home/facts'

  get 'home/resources'

  get 'home/whyquit'

  get 'home/signup'

  get 'home/features'

  # Forums

  get 'forum/index'

  get 'forum/showthread'

  get 'forum/reply'

  get 'forum/newthread'

  # Account

  get 'account/login'

  # Helper Actions
  get '/get_date' => 'home#get_date'
  post '/account/create' => 'account#create'
end
