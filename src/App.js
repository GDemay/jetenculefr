import React, { useEffect, useState } from 'react';
import './App.css';
import AutoPlayVideo from './AutoPlayVideo';

function App() {
  const [visitCount, setVisitCount] = useState(0);

  useEffect(() => {
    // Function to increment and retrieve the visit count
    const incrementVisitCount = () => {
      const count = parseInt(localStorage.getItem('visitCount') || 0);
      localStorage.setItem('visitCount', count + 1);
      return count + 1;
    };

    // Update the visit count
    const updatedCount = incrementVisitCount();
    setVisitCount(updatedCount);
  }, []);

  return (
    <div className="App">
      <AutoPlayVideo />
      <p>Page views: {visitCount}</p>
    </div>
  );
}

export default App;
