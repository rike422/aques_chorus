exec = require('child_process').exec

talkPiPath = "AquesTalkPi"
class AquesChorus

  constructor: (defalutTone = {g:100, s:100, v:"f1"}) ->
    @tone = defalutTone
    return if str == null || str == undefined

  sing: (str, cb) ->
    return if str == null || str == undefined
    command = "#{talkPiPath} \"#{str}\" #{@_optionPaser()} | aplay"
    exec command, (error) ->
      cb(error) if cb

  _optionPaser:() ->
    str = ""
    str += " -v #{@tone['v']} " if @tone.v?
    str += " -s #{@tone['s']} " if @tone.s?
    str += " -g #{@tone['g']} " if @tone.g?
    str

module.exports = AquesChorus
