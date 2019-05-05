# INSTAGRAM DOWNLOADER
This repository is based on https://github.com/serhattsnmz/turtle
It includes a docker container which will use selenium and choice of headless drivers to run instagram crawler script and then download all pictures to a local folder in the host .

# Requirements

- Python 3.6+
- Selenium
- PhantomJS
- Chrome Driver for Selenium
- Gecko Driver for Selenium

Requirements are fulfilled in Docker script.

#Running
A makefile is provided.
Edit config.json to include a valid instagram username and password.

- *driver*   : (*int*) Driver you want to use as default (*1* or *2* or *3*)
- *username* : (*string*) User's username
- *password* : (*string*) User's pass
- *path*     : (*string*) The path for saving photos. Default value is `photos`
    - Exp : `path/photos` or `../path/photos`

 - *target* : Insta account name to crawl. (just the account Id not url)  
```javascript
{
	"username":"",
	"password":"",
	"driver":1,
	"path":"photos",
	"target":""
}
```

`make container` to build local image .
`make docker-run` to run the container.

## Advanced Usage

```
usage: turtle_console.py [-h] [-u] [-p] [-d] [-P] [-l] [-D] [-v]

Fetch all the lectures for a Instagram

optional arguments:
  -h, --help        show this help message and exit
  -u , --username   User username
  -p , --password   User password
  -d , --driver     Choosen Driver. [1]PantomJS [2]Chrome [3]Firefox
  -P , --path       The path for saving photos.
  -l , --list       List of Usernames
  -D , --download   Download choice. [1]Update(Default for list) [2]Full
  -v , --video      Download videos or not. [True]Download [False] Do Not
                    Download(Default)
```