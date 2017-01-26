module RailsProxify
  class Engine < ::Rails::Engine
    isolate_namespace RailsProxify
  end
end
