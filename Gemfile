source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'rails-i18n'
gem 'devise'
gem 'devise-i18n'
gem 'russian'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'twitter-bootstrap-rails'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'mailjet'
gem 'dotenv-rails'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
end
