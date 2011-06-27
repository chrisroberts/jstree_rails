require 'rails_javascript_helpers'
module JsTreeRails
  module Viewers
    include RailsJavaScriptHelpers

    def jstree(dom_id, options={})
      javascript_tag do
        "jQuery(function(){
           jQuery('#{format_id(dom_id)}').jstree(
             #{format_type_to_js(options)}
           );
         });
        "
      end
    end

    # Send entire tree structure (-1 forces entire tree. update to make configurable)
    def jstree_send_link(name, dom_id, url_or_path, args={})
      link_to_function(name, args) do |page|
        page << "
          jQuery.ajax(
            #{format_type_to_js(url_or_path)}, {
            type : #{format_type_to_js(args[:method] || 'post')},
            data : {data : jQuery(#{format_type_to_js(format_id(dom_id))}).jstree('get_json', -1)}
          })"
      end
    end

  end
end

ActionView::Base.send :include, JsTreeRails::Viewers
