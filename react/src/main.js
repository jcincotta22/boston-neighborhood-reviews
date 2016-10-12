import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

$(function() {
  ReactDOM.render(
    <div>
      <App />
    </div>,
    document.getElementById('app')
  );
});
