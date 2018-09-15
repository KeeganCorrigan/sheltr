import React from "react"
// import PropTypes from "prop-types"
import GoogleMap from 'google-map-react';

export default class Directions extends React.Component {
  render () {
    return (
      <div style={{width: '100%', height: '400px'}}>
        <GoogleMap
          bootstrapURLKeys={{key: this.props.googleApiKey}}
          center={this.props.center}
          zoom={this.props.zoom}
        >
        </GoogleMap>
    );
  }
}

// Directions.propTypes = {
//   googleApiKey: PropTypes.string,
//   center: PropTypes.array,
//   zoom: PropTypes.number
// };

// export default Directions
