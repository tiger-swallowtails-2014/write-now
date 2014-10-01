var data = {
  // x axis: timestamp of each milestone
  labels: ["8:00 am", "9:30 am", "12:00 pm", "1:30 pm", "3:00 pm", "5:00 pm", "7:30 pm"],
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
        // y axis: current wordcounts of each milestone
    }
  ]
};

$(document).ready(function() {
  var context = document.getElementById("chart").getContext("2d");
  var newChart = new Chart(context).Line(data);
});