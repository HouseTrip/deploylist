# Setting up

* Install [postgresapp](http://postgresapp.com/)
* Add the Postgres executable to your PATH, see [this](http://postgresapp.com/documentation/cli-tools.html)
* `createuser postgres -d` (creates the postgres user in Postgres with ability to create databases)
* Run `./setup.rb`
* `foreman start`
* Visit http://localhost:3000

---

### Fetching deploys from Honeybadger:

`DeployFetcher => DeployImporter => Deploy`


### Fetching commits and creating story records

`CommitFetcher => StoryImporter => Story`
