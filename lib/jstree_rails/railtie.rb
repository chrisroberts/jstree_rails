module JsTreeRails
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'jstree_rails/tasks'
    end
  end
end
