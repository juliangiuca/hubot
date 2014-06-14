# Description:
#   Do a whois lookup for a .com, .net, .org and .io domain
#
# Commands:
#   hubot com <word> - reply back with the availability of the .com
#   hubot net <word> - reply back with the availability of the .net
#   hubot org <word> - reply back with the availability of the .org
#   hubot io <word> - reply back with the availability of the .io

Whoisjs = require("whoisjs").whois
who = new Whoisjs()

module.exports = (robot) ->

  robot.respond /(com|net|org|io) (.*)$/i, (msg) ->
    domain = msg.match[2] + "." + msg.match[1]
    who.query domain, (response) ->
      if response.available()
        msg.send domain + " is available"

      else if response.unavailable()
        msg.send domain + " is unavailable"

      else
        msg.send "Your request for " + domain + " error'd out. You're probably doing somethung dumb."
