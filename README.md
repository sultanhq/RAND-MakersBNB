#  RAND-MakersBNB

## Objective

An interactive site that invites owners of spaces to list and rent their space for a night, and renters to book those spaces!

If you can't be at home, why not be somewhere that at least feels like home?!

## User Stories:

##### Sign up & sign in
```
As a new User,
So that I can list my space,
I need a website that I can sign up to.
```
```
As an existing User,
So that I can access my account,
I need a website that I can sign into.
```

##### Creating and listing spaces
```
As a hosting User,
So that I can rent my space,
I need to be able to list a new space.
```
```
As a hosting User,
So that I can correctly list my space,
I need to add name, description, and price per night.
```
```
As a hosting User,
So that I can offer my space,
I need to enter the dates it is available.
```
```
As a hosting User,
So that I can host multiple spaces,
I need to be able to list multiple spaces.
```
```
As a hosting User,
So that I can check my listings,
I need to be able to view them.
```
```
As a renting User,
So that I can view spaces for rent on a chosen date,
I need to be able to view them.
```

##### Requesting spaces
```
As a renting User,
So that I can rent a space for one night,
I can request to rent a space.
```
```
As a renting User,
So that I know what spaces I've requested,
I can view all requests made.
```
```
As a hosting User,
So that I know which of my spaces have been requested,
I can view all requests received.
```

##### Confirming requests
```
As a hosting User,
So that I can take bookings for one night,
I need to be able to accept requests.
```
```
As a hosting User,
So that I can decline bookings for one night,
I need to be able to reject requests.
```
```
As a hosting User,
So that I can see all the bookings I've confirmed for my spaces,
I need to be able to see bookings received.
```
```
As a renting User,
So that I can see all my bookings that have been confirmed,
I need to be able to see bookings made.
```

##### Availability
```
As a User,
So that I can browse available spaces,
I need a page which only shows available spaces.
```
```
As a hosting User,
So that I can choose my guests,
The space will be available until I confirm a booking.
```
```
As a hosting User,
Once a room has been booked,
I need to indicate that the space is unavailable.
```

## Setup Instructions

* Fork and clone repo
* Run ```bundle install``` in the repo root folder
* Create two postgres databases named ```randbnb_test``` & ```randbnb_development```
* If desired, create Heroku app and database

## Using the Site

1. Access the site either locally or via your Heroku app

2. Sign up with email and password

3. User is taken to their dashboard, from which they can:
  * a. Click `Add space` to add and save a space with a name, description, price per night, dates that the space is available from and to
  * b. Click `My spaces` and view all the spaces they have listed. From here a user can `Edit space`
  * c. Click `My requests` and view all the (unconfirmed) requests they have made for a space, and received for their spaces
  * d. Click `My bookings` and view all the (confirmed) bookings they have made for a space, and received for their spaces
  * e. Enter a date in the `Search Availability` field and click `Search` in order to view spaces available to request for that night
  * f. Click `Request` against a chosen space, in order to send a request to the owner of that space

4. User is able to sign out, and sign back in to the site
