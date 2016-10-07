Capybara::Webkit.configure do |config|
  config.debug = false
  config.block_unknown_urls
  config.timeout = 5
end
