import React, {Component} from 'react';
import MicrohoodsList from './MicrohoodsList'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      microhoods: []
    }

    this.getIndex = this.getIndex.bind(this);
    this.myInterval;
  }

  getIndex() {
    $.ajax({
      url: '/api/microhoods',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ microhoods: data.microhoods });
    })
  }

  componentDidMount() {
    this.getIndex();
    this.myInterval = setInterval(this.getIndex, 5000);
  }

  render(){

    return(
      <div className='callout'>
        <MicrohoodsList microhoods={this.state.microhoods} />
        <div className='create-microhood-review-link'>
          <a href='/microhoods/new'>Create and Review a New Microhood</a>
        </div>
      </div>
    )
  }
}

export default App;
