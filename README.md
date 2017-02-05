# README
Youtube inverter is a website made to invert already made Youtube playlists.

# Installation

Simply clone the repository to your server like so:
git clone https://github.com/kustom666/youtube-inverter

You will need to set three environment variables as follows:
  - YT_CLIENT_ID : the oauth client id for your app
  - YT_CLIENT_SECRET : the oauth client secret for your app
  - YT_API_KEY : your app's youtube api key

Finally, change the redirect_uri in PlaylistInverterController with the url
to your own redirection.
