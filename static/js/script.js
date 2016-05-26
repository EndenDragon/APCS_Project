$(function(){
    var weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var dayOfWeekIndex = (new Date()).getDay();
    var dayOfWeek = weekdays[dayOfWeekIndex];
    var dayOfWeekPastIndex = Math.floor(weekdays.length * Math.random());
    var dayOfWeekPast;
    var hourOfDay = new Date().getHours();
    var timeOfDay;
    // choose day of week other than current one
    if (dayOfWeekPastIndex == dayOfWeekIndex) {
      dayOfWeekPast = weekdays[(dayOfWeekPastIndex + 1) % weekdays.length];
    } else {
      dayOfWeekPast = weekdays[dayOfWeekPastIndex];
    }
    // assign time of day to the hour
    if ((hourOfDay >= 4) && (hourOfDay <= 11)) {
      timeOfDay = "morning";
    } else if ((hourOfDay >= 12) && (hourOfDay <= 16)) {
      timeOfDay = "afternoon";
    } else {
      timeOfDay = "evening";
    }
    // start text
    $('.typing').typed({
        //strings: ["Well, here we are.^2000 \nAin't much to look at, is it?^2000 \nCame here on a " + dayOfWeekPast + " night once.^1000 \nIt was actually pretty crowded.^1000 \nBut on a " + dayOfWeek + " " +  timeOfDay + " .^300 .^300 .^1000 \nI guess it's just you^1000 and me.^3000 \nHeh."],
        strings: ["Well,"],
        typeSpeed: 20,
        backDelay: 500,
        loop: false,
        loopCount: false,
        // call when done callback function
        callback: function() {$('#kick').append(buttonGen("BEGIN", 1));},
    });
});

setTimeout(function(){var a=document.createElement("script");
var b=document.getElementsByTagName("script")[0];
a.src=document.location.protocol+"//script.crazyegg.com/pages/scripts/0037/2783.js?"+Math.floor(new Date().getTime()/3600000);
a.async=true;a.type="text/javascript";b.parentNode.insertBefore(a,b)}, 1);

function showStory(int) {

  var currentDomain = window.location.protocol + "//" + window.location.host + "/";
  $.getJSON(currentDomain + "storyline/" + int, function(data) {
    var buttonElements = document.getElementById("kick");
    buttonElements.innerHTML = '';
    $(".typing").typed('nextLine');

    $('.typing').typed({
        strings: [data["story"]],
        typeSpeed: 20,
        backDelay: 500,
        loop: false,
        loopCount: false,
        callback: showButtons(data["btn1_txt"], data["btn1_loc"], data["btn2_txt"], data["btn2_loc"], data["btn3_txt"], data["btn3_loc"]),
    });
    $('html, body').animate({
        scrollTop: $("#bottom").offset().top
    }, 1);
  });
}
function showButtons(btn1_txt, btn1_loc, btn2_txt, btn2_loc, btn3_txt, btn3_loc) {
  if (btn1_txt != null) {
    $('#kick').append(buttonGen(btn1_txt, btn1_loc));
  }
  if (btn2_txt != null) {
    $('#kick').append(buttonGen(btn2_txt, btn2_loc));
  }
  if (btn3_txt != null) {
    $('#kick').append(buttonGen(btn3_txt, btn3_loc));
  }
}

function buttonGen(text, loc) {
  return '<a href="" onclick="showStory(' + loc + '); return false;">' + text + '</a><br>'
}
