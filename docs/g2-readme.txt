g2 - can be read as "go to" is a CLI-based tinyurl-like tool

USAGE:
 g2 <urlhint> [<browser_type>]

 Let's say you defined "goog" to be the urlhint for "https://www.google.com", running:
  ./g2 goog

 will open https://www.google.com/ using the default browser (defined in $default2use).
 Supported browsers can be either defined by the user or as installed in the Tool Author's 
 machine.

 urlhint supports URL Parameters. 
 
 TODO: Examples will be added later
   
CONFIGURATIONS:
 * conf/g2.conf      - lists the urlhint and actual url that can be used in g2
 * conf/g2-user.conf - user can override the browser paths for supported browsers

AUTHOR:
 Ismael Angelo A. Casimpan, Jr. <ismael.angelo@casimpan.com>
 http://ismael.casimpan.com/
