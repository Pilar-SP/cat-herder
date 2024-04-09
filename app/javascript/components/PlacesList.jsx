import React from 'react'
import ReactDOM from 'react-dom/client'

const PlacesList = () => {
  return(
    <h1>hello from component</h1>
  )
}

// export default PlacesList;

const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(<PlacesList />)
