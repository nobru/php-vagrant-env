# default
default[:nobru][:manage_users] = false
default[:nobru][:web][:default][:root] = '/vagrant/www'
default[:nobru][:web][:default][:docroot] = '/vagrant/www'
default[:nobru][:web][:default][:host] = 'develop'
default[:nobru][:web][:default][:logpath] = '/var/log/nginx'

# timezone
override[:tz] = 'America/Sao_Paulo'

# chef-client
override[:chef_client][:init_style] = 'upstart'
override[:chef_client][:interval] = 300
override[:chef_client][:log_file] = 'client.log'

# sudo
override[:authorization][:sudo][:passwordless] = true

# Mysql
default['mysql']['server_debian_password'] = 'root'
default['mysql']['server_root_password'] = 'root'
default['mysql']['server_repl_password'] = 'root'

# PHP

lib_dir = 'lib'

override['php']['install_method'] = 'source'
override['php']['url'] = 'http://br1.php.net/get'
override['php']['version'] = '5.5.15'
override['php']['checksum'] = '9156fcd4b254cbfa9a7535f931da29d5'
override['php']['configure_options'] = %W{--prefix=#{php['prefix_dir']}
                                         --with-libdir=#{lib_dir}
                                         --with-config-file-path=#{php['conf_dir']}
                                         --with-config-file-scan-dir=#{php['ext_conf_dir']}
                                         --with-pear
                                         --enable-fpm
                                         --with-fpm-user=#{php['fpm_user']}
                                         --with-fpm-group=#{php['fpm_group']}
                                         --with-zlib
                                         --with-openssl
                                         --with-kerberos
                                         --with-bz2
                                         --with-curl
                                         --enable-ftp
                                         --enable-zip
                                         --enable-exif
                                         --with-gd
                                         --enable-gd-native-ttf
                                         --with-gettext
                                         --with-mhash
                                         --with-iconv
                                         --with-imap
                                         --with-imap-ssl
                                         --enable-sockets
                                         --enable-soap
                                         --with-xmlrpc
                                         --with-libevent-dir
                                         --with-mcrypt
                                         --enable-mbstring
                                         --with-t1lib
                                         --with-mysql
                                         --with-mysqli=/usr/bin/mysql_config
                                         --with-mysql-sock
                                         --with-sqlite3
                                         --with-pdo-mysql
                                         --with-pdo-sqlite}

