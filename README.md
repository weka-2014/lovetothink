lovetothink
===========

# Links
* https://waffle.io/euglazer/lovetothink

# Objectives
* Find a way to connect people by common interests. 
* Enjoy programming.
* Meet our learning objectives.
* Make something cool.

# Values
* Good relationships are built upon common doings
* People are defined less by their looks, and more by how they engage with the world and what they consume.
* Thinking is good.
* Safety and comfort are necessary.

# API Bullshit
## Json output from Eugene to Tye
* When the /matches page loads

	i. controller iterates through all users and collects their twitter username into an array of hashes
	```ruby
	  [ {user_id: 1, twitter_username: "misfitmod"}, {user_id: 2, twitter_username: "deephousekitty"}, ... ]
	```
  ii. controller takes that array, and fetches the last, let's say, 50 tweets from each person, and arranges that shit into a json hash. 
	```ruby
	[ 
		{ 
			user_id: 1,
			tweets: [
				{ 
					content: "blah blah blah blah",
					hashtags: ["#this", "#that"]
				},
				{ 
					content: "this is a tweet",
					hashtags: ["#hashtag", "#meow"]
				},
				{ 
					content: "lorem ipsum",
					hashtags: ["#pitter", "#patter"]
				}
			]
		},
			user_id: 2,
			tweets: [
				{ 
					content: "this is some text",
					hashtags: ["#idk", "#tweet"]
				},
				{ 
					content: "my tweets are understimulating",
					hashtags: ["#fuckeverything", "#bluepens"]
				},
				{ 
					content: "party party party",
					hashtags: ["#seaworld", "#savewhales"]
				}
			]
		},
	
		...
	
	]
	```
	iii. through some sort of witch-ery, tye sends me back an array of hashes of the following format:
	```ruby 
	[ {user_id: 2, percent: 0.43}, {user_id: 3, twitter_percent: 0.56}, ... ]
	```
	iv. controller takes that data, does some database bullshit, and sends the following json array of hashes for each match:
	```ruby 
	[ 
		{user_id: 2, name: "Eugene Lynch", blurb: "I LIKE CATS AND ELECTRITY", twitter_percent: 0.32}, 
		{user_id: 3, name: "Tye Fucking Bennet", blurb: "WELCOME TO INVERCARGILL", twitter_percent: 0.56}, 
		... 
	]
	```
