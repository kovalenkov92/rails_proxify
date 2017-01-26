RailsProxify::Engine.routes.draw do

  match '/*path', :to => 'requests#proxify',
        :via => [:get, :post, :put, :delete, :options, :head, :patch]

end
