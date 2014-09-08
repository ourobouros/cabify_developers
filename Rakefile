require "jekyll"

namespace :cabify do
  #
  # Because we are using 3rd party plugins for jekyll to manage the asset pipeline
  # and suchlike we are unable to just branch the code, we have to process the site
  # localy before pushing it to the branch to publish.

  desc "Publish cabify to gh-pages"
  task :publish do
    Jekyll::Site.new(Jekyll.configuration({
      "source"      => ".",
      "destination" => "_site",
      "config" => "_config.yml"
    })).process

    origin = `git config --get remote.origin.url`

    Dir.mktmpdir do |tmp|
      cp_r "_site/.", tmp

      Dir.chdir tmp

      system "git init"
      system "git add . && git commit -m 'Site updated at #{Time.now.utc}'"

      system "git remote add origin #{origin}"

      system "git push origin master:refs/heads/gh-pages --force"
    end

  end
end