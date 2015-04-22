Rails.application.routes.draw do

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
end
