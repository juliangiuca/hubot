# Description:
#   Do a whois lookup for a .com, .net, .org and .io domain
#
# Commands:
#   hubot lookup <domain>.<tld> - reply back with the availability of the .tld or .com

Whoisjs = require("whoisjs").whois
who = new Whoisjs()

module.exports = (robot) ->

  robot.respond /LOOKUP (\w+)\.?(\w{0,})$/i, (msg) ->
    domain = msg.match[1] + "." + (msg.match[2] || "com")
    who.query domain, (response) ->
      if response.available()
        msg.send domain + " is available"

      else if response.unavailable()
        msg.send domain + " is unavailable"

      else
        msg.send "Your request for " + domain + " error'd out. You're probably doing somethung dumb."
