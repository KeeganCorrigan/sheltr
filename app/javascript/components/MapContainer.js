import React from "react"
import PropTypes from "prop-types"
import Map from './Map'

class MapContainer extends React.Component {
  constructor(props) {
  super(props);
  this.state = {
    mapActive: false
  };
}
  renderMap() {
    if (this.state.mapActive === true) {
      return (
        < Map
        googleApiKey={this.props.googleApiKey}
        center={this.props.center}
        zoom={this.props.zoom}
        />
      );
    } else {
      return <div>Hi</div>
    };
  };

  handleButtonClick = () => {
    this.setState({mapActive: true})
  };

  render () {
    return (
      <div>

      <button
        className="btn btn-primary map-button"
        onClick={this.handleButtonClick}
      >
        View on Map
      </button>
      {this.renderMap()}
      </div>
    )
  }
}

MapContainer.propTypes = {
  googleApiKey: PropTypes.string,
  center: PropTypes.array,
  zoom: PropTypes.number,
  locationIndex: PropTypes.number
};

export default MapContainer
