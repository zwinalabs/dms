# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# match '/geds/remove_ged/:id', :controller => 'geds', :action => 'remove_ged', :via => [:get, :post, :delete]
# delete 'geds', :to => 'geds#destroy'

resources :geds
# , :controller => 'geds', :only => [:index, :show, :create, :destroy]


