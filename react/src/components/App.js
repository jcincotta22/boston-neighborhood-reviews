import React, {Component} from 'react';
import MicrohoodsList from './MicrohoodsList'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      microhoods: []
    }
  }

  componentDidMount() {
    $.ajax({
      url: 'api/microhoods',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ microhoods: data.microhoods })
    })
  }

  render(){

    return(
      <div>
        <MicrohoodsList microhoods={this.state.microhoods} />
      </div>
    )
  }
}

export default App;
