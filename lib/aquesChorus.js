(function() {
  var AquesChorus, exec, talkPiPath;

  exec = require('child_process').exec;

  talkPiPath = "AquesTalkPi";

  AquesChorus = (function() {
    function AquesChorus(defalutTone) {
      if (defalutTone == null) {
        defalutTone = {
          g: 100,
          s: 100,
          v: "f1"
        };
      }
      this.tone = defalutTone;
    }

    AquesChorus.prototype.sing = function(str, cb) {
      var command;
      if (str === null || str === void 0) {
        return;
      }
      command = "" + talkPiPath + " \"" + str + "\" " + (this._optionPaser()) + " | aplay";
      return exec(command, function(error) {
        if (cb) {
          return cb(error);
        }
      });
    };

    AquesChorus.prototype._optionPaser = function() {
      var str;
      str = "";
      if (this.tone.v != null) {
        str += " -v " + this.tone['v'] + " ";
      }
      if (this.tone.s != null) {
        str += " -s " + this.tone['s'] + " ";
      }
      if (this.tone.g != null) {
        str += " -g " + this.tone['g'] + " ";
      }
      return str;
    };

    return AquesChorus;

  })();

  module.exports = AquesChorus;

}).call(this);
