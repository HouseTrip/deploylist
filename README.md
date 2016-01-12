# Deploy List

HouseTrip deploys and changelog service. This app tracks deploys recorded at
[HoneyBadger](http://honeybadger.io) and parses commits (and diffs) at GitHub
to present a meaningful description of what features and stories were released.

Authentication for the app is implemented using Google OAuth. The default
configuration tracks deploys of the DeployList app itself from it's own
HoneyBadger account.

### Getting started

* `brew install postgresql` OR install the app [postgresapp](http://postgresapp.com/)
* (ensure postgresql server is up and running)
* Run `./setup.rb`
* Add a Github personal access token in .env under GITHUB_TOKEN.
  * Visit https://github.com/settings/tokens/new
  * Restrict this to just the public_repo scope.
* Optionally: Run `bundle exec rake deploylist:fetch` to seed the DB with deploylist's own deploys.
* `foreman start`
* Visit http://localhost:3000

NOTE: This will get you a version of DeployList that reports on its own deploys,

### Working with your own application
* Setup OmniAuth with Google Apps (if not already done for your organisation):
  * Create 2 apps under Google developer console - one for production app, one for local development
  * Add Google+ API to the list of APIs
  * Under Credentials, create a new ClientID and use: `<protocol>://<server>/users/auth/google_oauth2/callback` as the RedirectURI.
    * `<protocol>` should be https for production, http for localhost
    * `<server>` should be the DNS of your production app, and localhost:3000 for development
* Adjust the keys in .env to reflect your own use of HoneyBadger and Google OAuth etc.

---

### Fetching deploys from HoneyBadger:

    bundle exec rake deploylist:fetch

### Run tests

    bundle exec rspec
