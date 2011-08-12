require 'rails_javascript_helpers'
module JsTreeRails
  module Viewers
    include RailsJavaScriptHelpers

    def jstree(dom_id, options={})
      ("<div id=\"#{dom_id.sub(/^#/, '')}\" class=\"jstree-rails\"></div>" +
        javascript_tag{
          "jQuery(function(){
             jQuery('#{format_id(dom_id)}').jstree(
               #{format_type_to_js(options)}
             );
           });
          "
        }).html_safe
    end

    # Send entire tree structure (-1 forces entire tree. update to make configurable)
    def jstree_send_link(name, dom_id, url_or_path, link_args={}, ajax_args={})
      built_ajax_args = {
        :type => link_args.delete(:method) || 'post',
        :data => {
          :data => RawJS.new("jQuery(#{format_type_to_js(format_id(dom_id))}).jstree('get_json', -1)")
        }
      }.merge(ajax_args)
      link_to_function(name, link_args) do |page|
        page << "
          jQuery.ajax(
            #{format_type_to_js(url_or_path)},
            #{format_type_to_js(built_ajax_args)}
          )"
      end
    end

  end
end

ActionView::Base.send :include, JsTreeRails::Viewers
