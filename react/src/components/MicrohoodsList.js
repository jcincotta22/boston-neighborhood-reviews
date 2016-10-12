import React from 'react';
import Microhood from './Microhood'

const MicrohoodsList = props => {
  let microhoods = props.microhoods.map(microhood => {
    const { id, name } = microhood;
    return (
      <Microhood
        key={id}
        id={id}
        name={microhood.name}
        street={microhood.street}
        zip={microhood.zip}
        description={microhood.description}
      />
    );
  });

  return (
    <div className="row microhood-list">
      <div className="small-11 small-centered columns">
        <ul>
          {microhoods}
        </ul>
      </div>
    </div>
  );
};

export default MicrohoodsList;
