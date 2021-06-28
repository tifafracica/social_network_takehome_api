# TAKEHOME SOCIAL MEDIA API

A client needs to know what is happening on the social networks. All of them. Right now.

The three social networks the client is interested in are:

https://takehome.io/twitter

https://takehome.io/facebook

https://takehome.io/instagram

Because these social networks are so webscale, they don't always respond predictably. The delay in their response almost appears like someone waited for a random integer of seconds before responding!

Also, sometimes they will respond with an error. This error will not be valid JSON. Life's hard sometimes 😧.

Please, open the terminal and start the api with `rails s`

Then open another tab in the terminal, you needs to be able to run the next the command:
`curl localhost:3000`


And get back a JSON response of the output from the three social networks in the format:

`{ twitter: [tweets], facebook: [statuses], instagram: [photos] }`


⌨️ with ❤️ by [tifafracica](https://github.com/tifafracica) 😊
