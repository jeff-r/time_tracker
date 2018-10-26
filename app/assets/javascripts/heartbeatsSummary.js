class HeartbeatGraph {
  constructor() {
    this.state = {
      heartbeats: []
    }
  }

  fetchHeartbeats() {
    fetch("http://localhost:3000/hearbeats.json")
    .then(result => result.json())
    .then(json => this.state.heartbeats = json)
  }

  showHeartbeats() {
    console.log("-----------------")
  }
}

let graph = new HeartbeatGraph()
graph.showHeartbeats()