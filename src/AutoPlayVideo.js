import React from 'react';

function AutoPlayVideo() {
  return (
    <video autoPlay loop>
      <source src="/tagueule.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
  );
}

export default AutoPlayVideo;
