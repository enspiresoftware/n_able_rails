# NAbleRails

A simple Ruby wrapper to interact with N-able's API.

V0.1 This is a Read-Only version of the gem. 
  No changes will be made directly to the server only information will
  be pulled from the server. This may change in different versions.

Instructions to your N-able server is
[Here](https://secure.n-able.com/webhelp/NC_9-1-0_SO_en/Content/SA_docs/API_Level_Integration/API_Integration_WebServiceLevel.html)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'n_able_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install n_able_rails

## Usage

Start by initializing the N-Able Gem with the sas_url, the username, and
password.

The user must be an SO-Admin on the N-able Server.

```ruby
NAbleRails.initialize("http://sasurl.com", "Bob_Ross",
"Happy_Little_Password123")
```

## Methods

Get the server version info.

```ruby
  NAbleRails.version_info
```

List all devices for a customer
```ruby
  NAbleRails.list_devices("customer_id")
```

Get a specific devices information
```ruby
  NAbleRails.get_device_info("device_id")
```

List all properties of a device
```ruby
  NAbleRails.list_device_property("device_id")
```

List all customers
```ruby
  NAbleRails.list_customers
```

Get the device status
```ruby
  NAbleRails.device_status("device_id")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

