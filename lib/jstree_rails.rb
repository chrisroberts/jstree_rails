require 'jstree_rails/version'

if(defined?(Rails))
  require 'jstree_rails/generators'
  require 'jstree_rails/viewers'
  if(defined?(Rails::Railtie))
    require 'jstree_rails/railtie'
  end

  ActionView::Helpers::AssetTagHelper.register_javascript_expansion(
    :jstree => '/jstree_rails/javascripts/jquery.jstree.js'
  )
  ActionView::Helpers::AssetTagHelper.register_javascript_expansion(
    :plugins => '/jstree_rails/javascripts/jquery.jstree.js'
  )
end
