var isIntroPlaying = true; //This variable shows weather the intro is currently playing or has the player clicked the begin button.

$(function(){
    // start text
    $('.typingIntro').typed({
        strings: ["                    Hello! ^2000 <br> \n Welcome to our text-based choose-your-own-adventure game, Some Lost! ^2000 <br> \n Now, remember, this is a demo. ^1000 <br> \n So please don't expect too much! ^1000 <br> \n Now.^300 .^300 .^1000 \n <br> Let^300 us^300 begin^300."],
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
  console.log("Show story: " + int);
  var currentDomain = window.location.protocol + "//" + window.location.host + "/";
  $.getJSON(currentDomain + "storyline/" + int, function(data) {
    var buttonElements = document.getElementById("kick");
    buttonElements.innerHTML = '';
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
		setTimeout(showStory(int + 1), data["quicktimeplayer_seconds"] * 1000); //TODO: Edit MySQL Database so it would go to the proper next row (Instead of the assumed next row) if the player didnt press it in time.
	}
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
