TitleLoader = {
  animateHeader: function(text){
    current = 0;
    header = $(".main_header");
    setInterval(function() {
      if (current < text.length) {
        header.text(header.text() + text[current++]);
      }
    }, 120);
  },
  displayTagline: function() {
    $(".tagline").fadeIn(4700);
  }
}

$(document).ready(function() {
  var headerText = "WriteNow".split("");
  TitleLoader.animateHeader(headerText);
  TitleLoader.displayTagline();
});