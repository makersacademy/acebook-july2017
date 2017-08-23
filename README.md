![Build Status](https://api.travis-ci.org/makersacademy/acebook-july2017.svg?branch=master])
# AceBook

The card wall is [here on trello](https://trello.com/b/OCqCEIYX/acebook-july2017)

## Development
Take a minute to read the [CONTRIBUTING.md](CONTRIBUTING.md)

To run the app locally:

```bash
git clone https://github.com/makersacademy/acebook-july2017.git
cd acebook-july2017
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails server #  localhost:3000
```

## Tests

```bash
bin/rails db:migrate RAILS_ENV=test # Ensure your test environment is updated
bundle exec rspec # Runs the whole test suite
bundle exec rspec path/to/spec_file # Runs a single spec
```

## Staging
Pull requests are automatically staged as 'review apps' on heroku and will be available here:
![image](http://i.imgur.com/55FaD4J.png?1)

## Heroku Deployment

### https://acebook17.herokuapp.com
Heroku automatically deploys master branch on github to production.
