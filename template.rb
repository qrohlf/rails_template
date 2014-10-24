# template.rb
# generate(:scaffold, "person name:string")
# route "root to: 'people#index'"
# rake("db:migrate")

# use bootstrap-sass for styles
gem 'bootstrap-sass'
# use bootstrap-generators for scaffolding
gem 'bootstrap-generators'
# auto-prefix CSS
gem 'autoprefixer-rails'
# haml for templating
gem 'haml-rails'
# friendly_id for nice slugs
gem 'friendly_id'
# hirb for non-sucky debuggin
gem 'hirb'

gem_group :development, :test do
  gem "better_errors"
  gem "binding_of_caller" #needed for better_errors advanced features
end

# after_bundle do
# install bootstrap scaffold templates
generate 'bootstrap:install', "-e haml"
# create friendly_id migration
generate :friendly_id
# enable hirb in the console
environment <<-CODE
if $0 == 'irb'
  require 'hirb'
  Hirb.enable
end
CODE
git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }

# end