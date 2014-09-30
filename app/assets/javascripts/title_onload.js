window.onload = function(){
  var headerText = "WriteNow".split("")
  animateHeader(headerText);
};

animateHeader = function(text){
  current = 0;
  header = $(".main_header");
  setInterval(function() {
    if(current < text.length) {
      header.text(header.text() + text[current++]);
    }
  }, 120);
}