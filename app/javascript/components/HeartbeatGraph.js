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
  return (
    <div>
      {props.time}: {props.count}
    </div>
  );
};

class HeartbeatGraph extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      heartbeats: []
    };
  }

  componentDidMount() {
    this.hearbeatFetcher();
  }

  hearbeatFetcher() {
    fetch("/heartbeats.json")
      .then(result => result.json())
      .then(json => {
        const normalizedHeartbeats = Object.keys(json).map(key => ({
          time: key,
          count: json[key]
        }));

        console.log(normalizedHeartbeats);
        this.setState({
          heartbeats: normalizedHeartbeats
        });
      });
  }

  render() {
    return (
      <React.Fragment>
        <div>
          <Buckets heartbeats={this.state.heartbeats} />
        </div>
      </React.Fragment>
    );
  }
}

export default HeartbeatGraph;
