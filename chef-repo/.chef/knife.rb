current_dir = File.dirname(__FILE__)
log_level :info
log_location STDOUT
node_name "iliya"
client_key "#{current_dir}/iliya.pem"
validation_client_name "chef-validator"
validation_key "#{current_dir}/chef-validator.pem"
chef_server_url "https://chef-server"
cache_type "BasicFile"
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
