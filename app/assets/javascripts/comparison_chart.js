var data = {
  labels: ["January", "February", "March", "April", "May", "June", "July"],
  datasets: [
    {
        label: "My Second dataset",
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,0.8)",
        highlightFill: "rgba(151,187,205,0.75)",
        highlightStroke: "rgba(151,187,205,1)",
        data: [<%= project.dataset.join(", ") %>]
    }
  ]
};

$(document).ready(function() {
  var context = document.getElementById("chart").getContext("2d");
  var newChart = new Chart(context).Line(data);
});