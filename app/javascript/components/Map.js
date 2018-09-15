import React from "react"
import PropTypes from "prop-types"
import GoogleMap from 'google-map-react';
import Pin from './Pin'

class Map extends React.Component {
  render () {
    return (
      <div className="map-container">
        <GoogleMap
          bootstrapURLKeys={{key: this.props.googleApiKey}}
          center={this.props.center}
          zoom={this.props.zoom}
        >
        <Pin
          lat={this.props.center[0]}
          lng={this.props.center[1]}
        />
        </GoogleMap>
      </div>
    );
  }
}

Map.propTypes = {
  googleApiKey: PropTypes.string,
  center: PropTypes.array,
  zoom: PropTypes.number
};

export default Map
