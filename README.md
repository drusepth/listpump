# Listpump (aka reddit-watchlist)

This utility allows creating:

* **Named lists**, like "people who main Hanzo", and
* **Triggers**, which live on lists and "activate" when they match chatter online to automatically add users to their associated list

A trigger comes in two pairs:

* A `search_query`, which is used to filter the social firehose to related communication
* A regex `pattern`, which determines whether any particular message activates the trigger

Readme TBD