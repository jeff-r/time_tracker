import React from "react";

const Buckets = props => {
  return (
    <div>
      {props.heartbeats.map(bucket => (
        <Bucket key={bucket.time} time={bucket.time} count={bucket.count} />
      ))}
    </div>
  );
};
const Bucket = props => {
  const formattedTime = new Date(props.time).toLocaleTimeString();
  return (
    <div>
      {formattedTime}: {props.count}
    </div>
  );
};

class HeartbeatGraph extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      heartbeats: [],
      chartData: [],

      chartDataX: [],
      chartDataY: []
    };
  }

  componentDidMount() {
    this.hearbeatFetcher();
  }

  drawChart(dataX, dataY) {
    const data = {
      labels: dataX,
      series: [dataY]
    };

    new Chartist.Line("daychart", data);
    // let ctx = document.getElementById("daychart").getContext("2d");
    // new Chart(ctx, {
    //   type: "bar",
    //   data: {
    //     labels: dataX,
    //     datasets: [{ data: dataY }]
    //   }
    // });
  }

  hearbeatFetcher() {
    fetch("/heartbeats.json")
      .then(result => result.json())
      .then(json => {
        const chartData = Object.keys(json).map(key => ({
          x: new Date(key).toLocaleTimeString(),
          y: json[key]
        }));

        const chartDataX = Object.keys(json).map(key =>
          new Date(key).toLocaleTimeString()
        );
        const chartDataY = Object.keys(json).map(key => json[key]);
        console.log("***********************");
        console.log(chartDataX);
        console.log(chartDataY);
        const normalizedHeartbeats = Object.keys(json).map(key => ({
          time: key,
          count: json[key]
        }));

        this.setState({
          heartbeats: normalizedHeartbeats,
          chartData: chartData,
          chartdataX: chartDataX,
          chartDataY: chartDataY
        });
      });
  }

  render() {
    this.drawChart(this.state.chartDataX, this.state.chartDataY);
    return (
      <React.Fragment>
        <div />
      </React.Fragment>
    );
  }
}

export default HeartbeatGraph;
