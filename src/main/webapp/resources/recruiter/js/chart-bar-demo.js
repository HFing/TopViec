Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Kiểm tra sự tồn tại của phần tử script chứa dữ liệu JSON
var jobPostActivityCountsByStatusElement = document.getElementById('jobPostActivityCountsByStatus');
if (jobPostActivityCountsByStatusElement) {
  try {
    var jobPostActivityCountsByStatus = JSON.parse(jobPostActivityCountsByStatusElement.textContent);

    // Chuyển đổi dữ liệu thành mảng cho biểu đồ
    var labels = ["Pending Confirmation", "Contacted", "Tested", "Interviewed", "Hired", "Not Hired"];
    var data = [
      jobPostActivityCountsByStatus[1] || 0,
      jobPostActivityCountsByStatus[2] || 0,
      jobPostActivityCountsByStatus[3] || 0,
      jobPostActivityCountsByStatus[4] || 0,
      jobPostActivityCountsByStatus[5] || 0,
      jobPostActivityCountsByStatus[0] || 0
    ];
    var backgroundColors = [
      "rgba(2,117,216,1)",
      "rgba(92,184,92,1)",
      "rgba(240,173,78,1)",
      "rgba(217,83,79,1)",
      "rgba(41,43,44,1)",
      "rgba(91,192,222,1)"
    ];

    // Bar Chart Example
    var ctx = document.getElementById("myBarChart");
    var myBarChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          label: "Applications",
          backgroundColor: backgroundColors,
          borderColor: "rgba(2,117,216,1)",
          data: data,
        }],
      },
      options: {
        scales: {
          xAxes: [{
            gridLines: {
              display: false
            },
            ticks: {
              display: false // Loại bỏ các nhãn dưới các cột
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: Math.max(...data) + 10, // Giá trị tối đa của trục y, có thể thay đổi tùy theo dữ liệu thực tế
              maxTicksLimit: 5
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            }
          }],
        },
        legend: {
          display: true,
          position: 'bottom', // Hiển thị chú thích ở dưới biểu đồ
          labels: {
            generateLabels: function (chart) {
              var data = chart.data;
              if (data.labels.length && data.datasets.length) {
                return data.labels.map(function (label, i) {
                  return {
                    text: label,
                    fillStyle: data.datasets[0].backgroundColor[i],
                    hidden: false,
                    lineCap: 'butt',
                    lineDash: [],
                    lineDashOffset: 0,
                    lineJoin: 'miter',
                    lineWidth: 1,
                    strokeStyle: data.datasets[0].borderColor,
                    pointStyle: 'rect'
                  };
                });
              }
              return [];
            }
          }
        }
      }
    });
  } catch (e) {
    console.error("Invalid JSON data:", e);
  }
}