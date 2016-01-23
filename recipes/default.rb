package "acl" do
    action :install
end

node[:symfony][:sites].each do |name, attributes|
    # Merge shared attributes with site
    attributes = Chef::Mixin::DeepMerge.merge(node[:symfony][:shared], attributes)

    [
        "#{attributes[:directory]}/#{name}",
        "#{attributes[:directory]}/#{name}/current",
        "#{attributes[:directory]}/#{name}/releases",
        "#{attributes[:directory]}/#{name}/shared/app/config",
        "#{attributes[:directory]}/#{name}/shared/web/uploads",
        "#{attributes[:directory]}/#{name}/shared/log",
    ].each do |folder|
        directory folder do
          owner attributes[:user]
          group attributes[:group]
          mode "775"
          recursive true
          action :create
        end
    end
end