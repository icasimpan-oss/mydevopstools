OVERVIEW

Pseudo-ML (aka Pseudo Mailing List Manager) is an automated way for managing subscriber lists for command-line tools

TOOL STRUCTURE

Tool has the following files(relative to where you copied the whole "mydevopstools":

    * bin/pml       - main script for getting the subscribers
    * conf/pml.conf - defines the subscriber alias used in bin/pml
    * conf/pml/     - directory where the text file database of subscribers reside

CAPABILITIES

* Text file subscriber file

  As mentioned above, real subscriber files are in "conf/pml" directory. It is a simple text file that consists of one email per line. See sample below conf/pml/ml2.txt

    $ cat conf/pml/ml2.txt
    ml2a@subscribers.local
    ml2b@subscribers.local

  ml2.txt is further described as an alias so it can be directly usable by bin/pml. See the next capability below

* Loose subscriber name

  Real subscriber filename in conf/pml/* could be different from final subscriber name.
  For instance, conf/pml/ml1.txt is referred to as "internal" although you could also define it as "ml1". See the simple definition in conf/pml.conf below:

    $ cat pml.conf
    ## CONFIGURATION for ML Alias to mailing list file
    ##
    ## RULES:
    ##    * comment SHOULD start with # (no leading whitespaces)
    ##    * blank lines allowed
    ##    * "alias:ml_file.txt" should have no spaces anywhere
    
    ## internal => mailing list for internal IT
    internal:ml1.txt
    
    ## web => mailing list for web server maintainers
    web:ml2.txt
	
    ## grok team - ruby on rails
    grok:team_grok.txt
	
    ## cyborg team - Go Programming
    cyborg:team_cyborg.txt

 
* 1 Level "subscriber group" as subscriber

  As the number of mailing list grows, a need to be able to add a subscriber group directly into a mailing list is needed. For example, the web server maintainers (in mailing list "web") who are serving the needs of 2 teams: 
   (1) Team Cyborg - defined as "cyborg"
   (2) Team Grok - defined as "grok"
 
  needs to be subscribed to the corresponding mailing list for the two teams so they could anticipate their needs and include in forcasting/planning on server maintenance & upgrades. Members of "web" could be added manually to each subscriber "cyborg" and "grok" but that entails a huge maintenance penalty. It would be good if simply, the "web" (which from now on we will call "subscriber group") could be added so that as the "web" members grow, only its mailing list needs to be updated and all the teams that include it are automatically updated.

  The way this tool implements adding subscriber group as subscriber is by adding double underscore (__) to the alias defined in conf/pml.conf. However, only 1 level is allowed. Meaning a subscriber group added as a subscriber cannot itself have a subscriber group.

  Example, in "cyborg" alias (conf/pml/team_cyborg.txt), this is what you see:

    $ cat conf/pml/team_cyborg.txt
    me@anywhere.com
    who@thewindow.net
    __web

  That means, the __web is a "subscriber group".

  However, a "subscriber group" CANNOT include a "subscriber group". If you do, the sub-"subscriber group"(s) will be totally removed and a log will be created.
  To illustrate this point, consider a t1 subscriber group:

     $ cat ../conf/pml/t1.txt
     __cyborg
   
  From earlier example, we know that "cyborg" contains subscriber group __web + 2 email address.
  So the result:
  
     $ cat ../logs/pml/cyborg-violations.log
     Log timestamp: Sat, Sep 06, 2014 9:31:44 AM
     Parsing main listfile: ->./../conf/pml/team_cyborg.txt<-
     checking ref: ->__web<-
     -------- START BLOCK: possible violations -----
     -------- END BLOCK: possible violations -----
  
* Output either comma or semicolon separated
 
  Output in either comma separated(default) or semicolon separated for use in Microsoft Outlook. To show output in semicolon separated, pass 2nd parameter "-d='outlook'
  
    $ ./pml_subscribers cyborg -d='outlook'
    me@anywhere.com; who@thewindow.net; ml2a@subscribers.local; ml2b@subscribers.local

AUTHOR:
 Ismael Angelo A. Casimpan, Jr. <ismael.angelo@casimpan.com>
 http://ismael.casimpan.com/
