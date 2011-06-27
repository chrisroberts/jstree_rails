$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'jstree_rails/version'
Gem::Specification.new do |s|
  s.name = 'jstree_rails'
  s.version = JsTreeRails::VERSION
  s.summary = 'jsTree for Rails'
  s.author = 'Chris Roberts'
  s.email = 'chrisroberts.code@gmail.com'
  s.homepage = 'http://github.com/chrisroberts/jstree_rails'
  s.description = 'jsTree for Rails'
  s.require_path = 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'LICENSE.rdoc', 'CHANGELOG.rdoc']
  s.add_dependency 'rails_javascript_helpers', '~> 1.0'
  s.add_dependency 'rails', '>= 2.3'
  s.files = %w(README.rdoc CHANGELOG.rdoc) + Dir.glob("{files,lib}/**/*")
end
