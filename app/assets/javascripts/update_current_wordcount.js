$(function() {
  $('#updateWordCount').on('ajax:success', function(x,json,z, e) {
        console.log(json)
    var wordsLeft = json[0];
    var timeLeft = json[1];
    var paceNeeded = json[2];
    var percentComplete = json[3];
    $('.wordsLeft').text(wordsLeft);
    $('.timeLeft').text(timeLeft);
    $('.paceNeeded').text(paceNeeded);
    $('.progress .progress-bar').css("width", percentComplete + "%");
    $('#percentComplete').text(percentComplete + "%");
    draw_chart(json);
  });
});

var draw_chart = function(json){
  var context = document.getElementById("chart").getContext("2d");
  var newChart = new Chart(context).Line(data);
  
  var data = {
    var x_axis_length = json[5]
    var x_axis_interval
    labels: num_to_tenth_intervals(x_axis_length),
    datasets: [
      {
        label: "My stub dataset",
        fillColor: "rgba(0,0,0,0.2)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: [300,450,475,600,710,760,850]
      }
    ]
  };
  
}


var num_to_tenth_intervals = function(num) {
    number_end = num
    number_start = 0
    number_tenth = num / 10
    intervals = []
    while (num >= 0) {
      intervals.push(number_start);
      number_start += number_tenth;
    num -= number_tenth;
    }
    return intervals;
}