# frozen_string_literal: true

require 'bundler/setup'
require 'tap_watir'
require 'rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    opts = {url: 'http://localhost:4723/wd/hub',
            platformName: 'Android',
            platformVersion: '8.1',
            deviceName: 'Nexus',
            appWaitActivity: 'com.address.book.MainActivity',
            app: 'https://github.com/address-book/mobile_apps/blob/master/AddressBook.apk?raw=true'}

    $app = TapWatir::App.new(caps: opts)
  end

  config.after(:suite) do
    $app.close
  end
end
