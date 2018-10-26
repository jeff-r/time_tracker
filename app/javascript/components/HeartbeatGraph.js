import React from "react";

const HiThere = () => <div>Hi there from React</div>;

class HeartbeatGraph extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      hearbeats: []
    };
  }

  componentDidMount() {
    this.hearbeatFetcher();
  }

  hearbeatFetcher() {
    fetch("/heartbeats.json")
      .then(result => result.json())
      .then(json => this.setState({ hearbeats: json }));
  }

  render() {
    return (
      <React.Fragment>
        <div>{JSON.stringify(this.state.hearbeats)}</div>
      </React.Fragment>
    );
  }
}

export default HeartbeatGraph;
