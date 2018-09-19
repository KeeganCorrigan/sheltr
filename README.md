# SheltR

SheltR is a responsive web app built with react and rails that seeks to connect underhoused and homeless with resources, like shelters, food, places to stay, and crisis services. SheltR is built to be simple to use and intuitive and includes internationalization for Spanish. It is also tied to a Twilio SMS service where a user can text a city or zip code to the number and receive information about the nearest open shelter. Sheltr incorporates google omniauth 2 but only for admin use currently.

### Rails version: 5.1.6
### Rails-React version: 2.4.7

## To view the site live, visit: https://needsheltr.herokuapp.com/

## Configuration

Clone the respository

`git clone https://github.com/KeeganCorrigan/sheltr.git`

Install Gems:
```
$ bundle install
$ bundle update
```

Create the database:

`$ rake db:{drop,create,migrate}`

Running the test suite:

`$ rspec`

* A note about the suite: API keys for google maps and places are required. It also incorporates VCR and factory bot.

## Deployment instructions

Assets are compiled using webpack:

`$ rake assets:clobber`

Then push to heroku. If you encounter errors, check for the following:

* Make sure you only have `yarn.lock`, not `package-lock.json`.
* Make sure assets aren't precompiled locally. If `app/public/packs` is present you will need to delete the file.
* You may also need to run `yarn upgrade` (you should receive this error when trying to run a local server using `rails s`)
* I recommend creating a staging heroku app to test deploys as well.

#### Further reading on webpack:

https://github.com/rails/webpacker

### Some screenshots of the app:

#### Desktop screenshot:

![sheltr app desktop image](https://github.com/KeeganCorrigan/sheltr/blob/master/Screen%20Shot%202018-09-15%20at%203.28.27%20PM.png)

#### Mobile screenshot:

![sheltr app mobile image](https://github.com/KeeganCorrigan/sheltr/blob/master/Screen%20Shot%202018-09-19%20at%2010.39.36%20AM.png)



