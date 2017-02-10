module Dms
  module Hooks
    class ViewIssuesShowDescriptionBottomHook < Redmine::Hook::ViewListener
      include Redmine::I18n
      def view_issues_show_description_bottom(context={ })
        # include Redmine::I18n
        #binding.pry
        context[:controller].send(:render_to_string, {
            :partial => 'geds/dms',
            :locals => {:issue => context[:issue]},
            :layout => false
        })

      end
    end
  end
end

