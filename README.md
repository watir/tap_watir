# TapWatir

Watir for testing your Mobile Devices. Powered by Appium.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tap_watir'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tap_watir

## Usage

For right now, this is how you access a Chrome browser locally:
```
appium_url = 'http://localhost:4723/wd/hub'
caps = {platformName: 'Android',
        platformVersion: '8.1',
        deviceName: 'Nexus',
        browserName: 'Chrome'}

browser = TapWatir::MobileBrowser.new(url: appium_url, 
                                           desired_capabilities: caps)
```

## Development

To get the specs to run:
* Install Android Studio
* Create a Virtual Device named Nexus using Android 8.1
* Install Appium Desktop v1.6.2 
* Download [Chromedriver 2.34](https://chromedriver.storage.googleapis.com/index.html?path=2.34/) and specify its location in Appium Desktop Advanced Tab
* Start the Appium server.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/watir/tap_watir.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
