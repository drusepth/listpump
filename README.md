# Listpump

This utility allows creating:

* **Named lists**, like "people who main Hanzo", and
* **Triggers**, which live on lists and "activate" when they match chatter online to automatically add users to an associated list

A trigger comes in two pairs:

* A `search_query`, which is used to filter the social firehose to related communication
* A regex `pattern`, which determines whether any particular message activates the trigger

![List screenshot](http://i.imgur.com/MFUKJWr.png)

# Development

To get started:

1. Clone the repo
    git@github.com:drusepth/listpump.git

2. Install dependencies
    bundle install

3. Create and migrate a local database (sqlite3)
    rake db:create
    rake db:migrate

4. Run the server
    rails server

5. Visit your local instance and set up your lists!
   http://localhost:3000/

To run a local worker for your lists, run `rake reddit:run`. You'll need to set
the following environment variables for your reddit API access:

* REDDIT_CLIENT_ID
* REDDIT_SECRET
