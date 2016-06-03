$(function(){
    // start text
    $('.typingIntro').typed({
        strings: ["Hello! ^2000 <br> \n Welcome to our text-based choose-your-own-adventure game, Some Lost! ^2000 <br> \n Now, remember, this is a demo. ^1000 <br> \n So please don't expect too much! ^1000 <br> \n Now.^300 .^300 .^1000 \n <br> Let^300 us^300 begin^300."],
        typeSpeed: 20,
        backDelay: 500,
        loop: false,
        loopCount: false,
        // call when done callback function
        callback: function() {$('#kick').append('<a href="" onclick="startStory(); return false;">BEGIN</a><br>');},
    });
});
function startStory(){
	showStory(1);
	
}
setTimeout(function(){var a=document.createElement("script");
var b=document.getElementsByTagName("script")[0];
a.src=document.location.protocol+"//script.crazyegg.com/pages/scripts/0037/2783.js?"+Math.floor(new Date().getTime()/3600000);
a.async=true;a.type="text/javascript";b.parentNode.insertBefore(a,b)}, 1);

function showStory(int) {
	clearTimeout();
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
	if (data["quicktimeplayer_enabled"] == 1) {
		setTimeout(showStory(int + 1), data["quicktimeplayer_seconds"] * 1000);
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

//Traps the enter key (13) and simulates a button click on the first link it querys up
$(document).keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
      $(".typing").typed('instaPrint');
    }
});
