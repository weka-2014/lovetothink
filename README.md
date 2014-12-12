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

# rails - c#matcher interactions
* When the /matches page loads

	i. controller iterates through all users and collects their twitter username into an array of hashes
	```ruby
	  [ {"user_id": 1, "twitter_username": "misfitmod"}, {"user_id": 2, "twitter_username": "deephousekitty"}, ... ]
	```
  ii. controller takes that array, and fetches the last, let's say, 50 tweets from each person, and arranges that shit into a json hash. That hash is sent to the matcher via HTTPARTY.
	```ruby
	[
	user: {
		"user_id": 1,
		"tweets": [
			{
				"content": "oooooooo wooooowwww hehehe"
				"hashtags": ["LSD","wutislife"]
			},
			{
				"content": "i am a fruit"
				"hashtags": ["stillLSD","IAMYEEZUS"]
			}
		]
	},

	matches: [ 
		{ 
			"user_id": 2,
			"tweets": [
				{ 
					"content": "blah blah blah blah",
					"hashtags": ["this", "that"]
				},
				{ 
					"content": "this is a tweet",
					"hashtags": ["hashtag", "meow"]
				},
				{ 
					"content": "lorem ipsum",
					"hashtags": ["pitter", "patter"]
				}
			]
		},
			"user_id": 3,
			"tweets": [
				{ 
					"content": "this is some text",
					"hashtags": ["idk", "tweet"]
				},
				{ 
					"content": "my tweets are understimulating",
					"hashtags": ["fuckeverything", "bluepens"]
				},
				{ 
					"content": "party party party",
					"hashtags": ["seaworld", "savewhales"]
				}
			]
		},
	
		...
	
	]
]
	```
	iii. using httparty, the controller will receive the matcher's response, which will be of the following format:
	```ruby 
	[ {"user_id": 2, "twitter_percent": 0.43}, {"user_id": 3, "twitter_percent": 0.56}, ... ]
	```
	iv. controller takes that data, does some database bullshit, and arranges the following array of hashes for each match, to be sent to sarah's view:
	```ruby 
	[ 
		{"user_id": 2, name: "Eugene Lynch", "blurb": "I LIKE CATS AND ELECTRITY", "twitter_percent": 0.32}, 
		{"user_id": 3, name: "Tye Fucking Bennet", "blurb": "WELCOME TO INVERCARGILL", "twitter_percent": 0.56}, 
		... 
	]
	```
	
# RAILS API ENDPOINTS:
```ruby
get '/personal'
	type: 'get'
	url: '/personal'
	matcher_data_out: array of hashes, each containing user_id and tweet data.
	matcher_data_in: array of hashes, each containing a user_id and percent 
	render_view: "personal.html.erb"
	render_view_data: array of hashes, each containing user_id, name, blurb, image_url, and twitter percent. Also user's info: name, blurb, image_url, last 5 tweets.

get '/profile/:user_id'
	type: 'get'
	url: '/profile/:user_id'
	matcher_data_out: one hash, with user_id and tweet data
	matcher_data_in: one hash, with user_id and twitter_percent
	render_view: "profile.html.erb"
	render_view_data: one hash, with user_id, name, blurb, and twitter_percent.

get '/'
	type: 'get'
	url: '/'
	if current user logged in 
		redirect_to /users/sign_in
	else
		redirect_to /personal
	end

get '/users/sign_in'
	type: 'get'
	url: '/users/sign_in'

get '/users/sign_up'
	type: 'get'
	url: '/users/sign_up'

```
