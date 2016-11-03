# Orghunter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'orghunter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orghunter

## Usage

API keys must be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem.

```ruby
Orghunter.configure do |config|
  config.api_key = YOUR_KEY_HERE
end
```

Getting these keys requires a (free) Orghunter account and that you agree to the terms of use for the API.

The keys are available to you throughout your application as:

```ruby
Orghunter.configuration.api_key
```

## Contributing

1. Fork the repo on GitHub.
2. Clone the project to your own machine
3. Add you API key to the cassettes
4. Run `bundle && bundle exec rake', you will need an API key for tests to work.
5. Commit changes to your own branch
6. Push your work back up to your fork
7. Submit a Pull request so that we can review your changes

NOTE: Be sure to merge the latest from "upstream" before making a pull request!

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

