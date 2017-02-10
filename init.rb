require 'redmine'
Redmine::Plugin.register :dms do
  name 'Dms plugin'
  author 'Kaiis Alcherif kal@audaxis.com'
  description 'This is a plugin used to track documents and reduce paper'
  version '0.0.1'

  project_module :geds do
    permission :manage_geds, {:geds => [:index, :show, :create, :destroy]}
  end
end



Rails.application.config.to_prepare do
  require_dependency 'issue'
  Issue.send(:include, Dms::Patches::IssuePatch)
end
require 'dms/hooks/view_issues_show_description_bottom_hook'

