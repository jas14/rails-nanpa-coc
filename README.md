# NANPA::COC

A Rails engine providing models, migrations, and tasks to import a database of NANPA Central Office Codes into your Rails app.

## Usage
Install and run migrations:

```
$ rake nanpa_coc:install:migrations
$ bundle exec rails db:migrate
```

Then, download and import the Central Office Code report:

```
$ rake nanpa:download nanpa:import
```

This will take a while.

Once installed, use `NANPA::COC::CentralOfficeCode` like any other Rails model. Fields of note:
- `npa_nxx`: the normalized NPA-NXX, e.g. 401-245 becomes 401245
- `rate_center`: title of the location, often the name of a town/city
- `state`: 2-letter state abbreviation

## Installation
Add this line to your application's Gemfile:

```ruby
gem "nanpa-coc", github: "jas14/rails-nanpa-coc"
```

And then execute:
```bash
$ bundle
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
