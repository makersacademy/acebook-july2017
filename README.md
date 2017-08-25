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

To set up the remote hosting for images:

- Sign up to [AWS](https://aws.amazon.com/) and create a bucket to store file uploads.
- Create a `.env` file in the root directory of the project and include the following details:
```
S3_BUCKET_NAME=(bucket name)
AWS_ACCESS_KEY_ID=(your key)
AWS_SECRET_ACCESS_KEY=(your secret access key)
AWS_REGION=(region, eg eu-west-2)
```
- Add `.env` to your `.gitignore` file

A heroku guide to setting up a project with AWS and Paperclip can be read [here](https://devcenter.heroku.com/articles/paperclip-s3).
A Paperclip Github guide can be read [here](https://github.com/thoughtbot/paperclip/wiki/Paperclip-with-Amazon-S3).


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

### Database Issues
Due to poor planning, features were pushed live without their associations (ie. 'commenting' without the 'user' association in the database). This caused issues when the association was added, as existing items in the database had NULL values in the foreign key column.
In order to eliminate errors, a migration was written for populating the NULL values in the production database ([PR here](https://github.com/makersacademy/acebook-july2017/pull/28)).
To test the migration effectively, the production database was duplicated, and the migration was run locally. The process was as follows:

- Generate a backup of the database. This backup appears as a .dump in the current folder:
```
heroku pg:backups:capture
```
- Create a local database which we will populate from the .dump backup:
```
createdb acebook17-guineapig]
```
- Populate the database with the backup:
```
pg_restore -d acebook17-guineapig "latest.dump"
```
- Create a new environment in config environments (in this case; guineapig.rb)
- Add the database to the environment (config/database.yml):
```
guineapig:
  <<: *default
  database: acebook17-guineapig
```
- run a migration using our new environment:
```
bin/rails db:migrate RAILS_ENV="guineapig"
```
