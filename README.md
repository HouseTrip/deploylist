# Deploy List

HouseTrip deploys and changelog service.

### Getting started

* `brew install postgresql` OR install the app [postgresapp](http://postgresapp.com/)
* (ensure postgresql server is up and running)
* Setup OmniAuth with Google Apps (if not already done for your organisation):
  * Create 2 apps under Google developer console - one for production app, one for locale development
  * Add Google+ API to the list of APIs
  * Under Credentials, create a new ClientID and use: `<protocol>://<server>/users/auth/google_oauth2/callback` as the RedirectURI.
    * `<protocol>` should be https for production, http for localhost
    * `<server>` should be the DNS of your production app, and localhost:3000 for development
* Run `./setup.rb` and follow the instructions
* `bundle exec foreman start`
* Visit http://localhost:3000

---

### Fetching deploys from HoneyBadger:

    bundle exec rake deploylist:fetch

### Run tests

    bundle exec rake
    # or
    bundle exec rspec
