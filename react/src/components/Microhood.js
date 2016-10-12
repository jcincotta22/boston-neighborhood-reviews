import React from 'react';

const Microhood = props => {
  let path = `/microhoods/${props.id}`;
  return(
    <li>
      <div className='microhood-link'>
        <a href={path}>{props.street}, {props.zip}</a>
      </div>
    </li>
  );
};

export default Microhood;
