#!/usr/bin/env rake

desc "Synchronize site with production"
task :sync do
  system "rsync -e 'ssh' -avz --delete _site/ maxirails@us-pro-front1:/var/www/cabify_developers"
end

