var sh = 18;

function dropSh(val) {
  var $txsh = $('p').css('text-shadow');
  $('p').css('text-shadow', $txsh + ', ' + val + 'px ' + val + 'px 0 red');
}

var i = 0;

function myLoop () {
   setTimeout(function () {
    dropSh(i);
    i++;
      if (i < sh) {
         myLoop();
    }
   }, 5*(i*5/3))
}

myLoop();