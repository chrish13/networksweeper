# NetworkSweeper - A fast ping network scanner
> A simple script/program created with bash.

## Table of Contents
* [General Info](#general-info)
* [Technologies](#technologies) 
* [Installation](#installation)
* [Usage](#usage)
* [Status](#status)
* [Contributing](#contributing)
* [Credits](#credits)
* [License](#license)

## General Info
This tool is based on ping command that comes with \*nix systems and not the MS
Windows version. 
I made it mostly to expiriment with my scripting skills and create a more all in-
one solution for myself.

### Author
Chris Hatzis

## Technologies
> * GNU bash, version 5.0.16(1)-release (x86_64-pc-linux-gnu)
> * ping from iputils s20190709

## Installation

>### Pre-requirments
>	* Gnu bash 
>	* git (for cloning this project)

Basically create a folder somewhere within your home directory and clone this project in it.
```bash
	mkdir foofolder
	git clone https://github.com/chrish13/networksweeper.git ./foofolder
	cd foofolder
	chmod u+x ./networksweeper.sh
```
## Usage
You could use it by simple typing the following in your terminal
```bash
	./networksweeper 192.168.1.
```
or
```bash
	./networksweeper -s 192.168.1.
```
**Remember to replace ***192.168.1.1*** with your network**
At the moment the only available options are the following
```
	-s <subnet>
	-h Shows a quick in terminal help and exits.
	-V Shows current version and exits.
```
## Status
I am currently actively working on this project. My goal is to keep it simple with only using GNU bash scripting language. Next I would like to focus on its performance if there is (I belive always is) any room for it to become better. As for my ToDo's 

### To Do
	- [] Add more comments
	- [] Improve the man page. (yes I have already created a man page and the only way to read it is man ./networksweeper
	     from the project's folder).
	- [] Option to output the results only into a file
	- [] Option to output the results into a file and on STDOUT
	- [] Option to choose file type (csv, txt etc) and format the output
	- [] Verbose option
	- [] Install script
Of course the above list is not ordered by priority.

## Contributing
Please feel free to drop any comment in regards on how to improve this project, and the next thing is to add your name in the following section(if you wish though)

## Credits
-

## License
At the moment this is to complicated for me to have a standard license in place. So please use it as you wish and please add link back here.
Thank you for using this project.
