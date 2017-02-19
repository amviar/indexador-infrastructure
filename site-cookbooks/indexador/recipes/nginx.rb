# apt_repository 'phusionpassenger' do
#   uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
#   distribution node['lsb']['codename']
#   components %w(main)
#   deb_src true
#   keyserver 'keyserver.ubuntu.com'
#   key '561F9B9CAC40B2F7'
# end

# execute 'sudo apt-get update' do
#   ignore_failure true
#   timeout 60
# end

# apt_package 'nginx-extras'


# # TODO: Falla con error "Job for nginx.service failed because the control process exited with error code. See "systemctl status nginx.service" and "journalctl -xe" for details."
# # el comando que ejecuta es: `/bin/systemctl --system reload nginx`
# service 'nginx' do
#   supports status: true, restart: true, reload: true
#   action :enable
# end

# include_recipe 'nginx::commons'
# include_recipe 'nginx::passenger'

# # TODO: No encuentra el directorio
# # bash 'fix permissions of passenger gem' do
# #   code 'chmod a+r /var/lib/gems/2.3.0/specifications/*.gemspec'
# #   user 'root'
# # end

# cookbook_file "/etc/nginx/sites-available/indexador" do
#   source 'site-indexador'
# end

# cookbook_file "/etc/nginx/sites-available/indexador-input-rss" do
#   source 'site-indexador-input-rss'
#   # notifies :reload, 'service[nginx]', :delayed
# end

# nginx_site "indexador" do
#   enable true
# end

# nginx_site "indexador-input-rss" do
#   enable true
# end

# nginx_site "default" do
#   enable false
# end

# # TODO: Para setup de futuros certificados
# directory '/etc/certs' do
#   owner 'www-data'
#   group 'www-data'
# end


apt_package 'nginx-extras'

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

include_recipe 'nginx::commons'
