import React from "react"
import PropTypes from "prop-types"
import GoogleMap from 'google-map-react';

class Map extends React.Component {
  render () {
    return (
      <div style={{width: '50%', height: '400px'}}>
        <GoogleMap
          bootstrapURLKeys={{key: this.props.googleApiKey}}
          center={this.props.center}
          zoom={this.props.zoom}
        >
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
