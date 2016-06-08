var isIntroPlaying = true; //This variable shows weather the intro is currently playing or has the player clicked the begin button.
var quickTime; //Initialize Quicktime as a global variable
var currentBackground = "no_image.png"; //Default background to load at the start of the page load

document.documentElement.style.background = backgroundCSSGen(currentBackground); //gets the <html> tag and set the background

$(function(){
    // start text
    $('.typingIntro').typed({
        strings: ["Hello! ^2000 <br> \n Welcome to our text-based choose-your-own-adventure game, Some Lost! ^2000 <br> \n Now, remember, this is a demo. ^1000 <br> \n So please don't expect too much! ^1000 <br> \n Now.^300 .^300 .^1000 \n <br> Let^300 us^300 begin^300."],
        typeSpeed: 30,
        backDelay: 500,
        loop: false,
        loopCount: false,
        // call when done callback function
        callback: function() {$('#kick').append('<a href="" onclick="startStory(); return false;">BEGIN</a><br>');},
    });
});

function startStory(){
  $(".typingIntro").fadeOut();
	showStory(1);
  isIntroPlaying = false;
}

function showStory(int) {
  clearTimeout(quickTime);
  console.log("Show story: " + int);
  var currentDomain = window.location.protocol + "//" + window.location.host + "/";
  $.ajax({
    url: currentDomain + "storyline/" + int,
    dataType: 'json',
    success: function( data ) {
      var buttonElements = document.getElementById("kick");
      buttonElements.innerHTML = '';
      document.documentElement.style.background = backgroundCSSGen(data["bgimg"]);
      if (int != 1) {
        $(".typing").typed('nextLine');
      } //Row 1 is the beginning of the story, we dont need to have it make a new line for us.

      $('.typing').typed({
          strings: [data["story"]],
          typeSpeed: 30,
          backDelay: 500,
          loop: false,
          loopCount: false,
          callback: showButtons(data["btn1_txt"], data["btn1_loc"], data["btn2_txt"], data["btn2_loc"], data["btn3_txt"], data["btn3_loc"]),
      });
  	  if (data["quicktimeplayer_enabled"] == 1) {
  		  quickTime = setTimeout(function(){
  			     showStory(data["quicktimeplayer_nextoption"]);
             alert("Oh no! I sense a QUICKTIME is coming! You have " + data["quicktimeplayer_seconds"] + " second(s) to act upon your decision!");
  		  }, data["quicktimeplayer_seconds"] * 1000);
  	  }
    },
    error: function( data ) {
      showStory(int); //Recursive, being that it runs the function again if there is an error at getting the url (We all LOVE school wifi!).
    }
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

function backgroundCSSGen(fileName) {
  if (fileName == "no_image.png") {
    fileName = "intro1.gif"; //default image for "blank" background in the database
  }
  return 'linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(/static/bg/' + fileName + ') fixed'
}

$(document).keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){ //Traps the enter key (13) and instant prints the rest
      if (isIntroPlaying) {
        $(".typingIntro").typed('instaPrint');
      }
      else {
        $(".typing").typed('instaPrint');
      }
    }
    if (keycode == '76') { //If "L" key pressed
      var loc = prompt("Enter a location");
      loc = parseInt(loc);
      if (loc != NaN) {
        if (isIntroPlaying) {
          $(".typingIntro").typed('instaPrint');
          startStory();
          showStory(loc);
        } else {
          $(".typing").typed('instaPrint');
          if (loc == 1) {
            $(".typing").typed('nextLine');
          }
          showStory(loc);
        }
      }
    }
});
