include_recipe 'timezone-ii'
include_recipe 'chef-client::delete_validation'
include_recipe 'chef-client::config'
include_recipe 'chef-client'
include_recipe 'apt'
include_recipe 'vim'
include_recipe 'nobru::app'