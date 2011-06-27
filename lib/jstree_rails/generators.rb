require 'rails_javascript_helpers'

module JsTreeRails
  module Generators
    include RailsJavaScriptHelpers
    
    def jstree(dom_id, options={})
      "jQuery('#{format_id(dom_id)}').jstree(
         #{format_type_to_js(options)}
       );
      "
    end
  end
end

ActionView::Helpers::PrototypeHelper::JavaScriptGenerator::GeneratorMethods.send :include, JsTreeRails::Generators
