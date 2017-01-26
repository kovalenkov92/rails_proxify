# RailsProxify

![Gem Version](https://img.shields.io/badge/gem%20version-0.0.2-brightgreen.svg)
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_proxify'
```

And then execute:

    $ bundle

Mount rails_proxify engine to your routes. Add this to routes.rb

```ruby
mount RailsProxify::Engine => '/{your-proxy-namespace}'
```

## Usage

Now you are able to send requests to foreign servers in context of your own rails server. For example:
 
 ````javascript
 $.post("/{your-proxy-namespace}/https://example.com/login", function(data) {
   makeSomethingWithYour(data);
 })
 ````

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kovalenkov92/rails_proxify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

