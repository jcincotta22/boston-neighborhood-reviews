import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

$(function() {
  if(document.getElementById('app') !== null){
    ReactDOM.render(
      <div>
        <App />
      </div>,
      document.getElementById('app')
    );
  }
});
