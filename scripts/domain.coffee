# Description:
#   Do a whois lookup for a .com domain
#
# Commands:
#   hubot domain <word> - reply back with the availability of the .com

Whoisjs = require("whoisjs").whois

module.exports = (robot) ->

  robot.respond /DOMAIN (.*)$/i, (msg) ->
    who = new Whoisjs()
    domain = msg.match[1] + ".com"
    who.query domain, (response) ->
      if response.available()
        msg.send domain + " is available"

      else if response.unavailable()
        msg.send domain + " is unavailable"

      else
        msg.send "Something broktd"


