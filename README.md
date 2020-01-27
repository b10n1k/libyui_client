# LibyuiClient

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/libyui_client`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'libyui_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install libyui_client

## Usage

TODO: Write usage instructions here

## Setup Environment
We use [rbenv](http://github.com/rbenv/rbenv) to setup the desired ruby and isolated it from the system. This will provide us with a common environment to work on. `rbenv` sets up the PATH variable to find the installed gems which is stored under a directory of each version.

To setup the environment run (for bash users)
```
$ ./runme.sh
```
TODO: script is in progress
The script setup rbenv with specific Ruby version and then executes the `bin/setup` to install all the required gems.

Other useful commands
- Verify rbenv installation
```bash
$ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

- List available versions
```bash
$ rbenv install -l
```

- Check what version rbenv is using
```bash
$ rbenv version
```
- Set ruby for current directory
```bash
$ rbenv local <rb_version>
```

- Set ruby for the whole system
```bash
$ rbenv global <rb_version>
```

- Check where gems are loated
```bash
$ gem env home
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/libyui_client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
