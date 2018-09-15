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
      return null
    };
  };

  handleButtonClick = () => {
    const mapActive = this.state.mapActive ? false : true ;
    this.setState({mapActive})
  };

  renderButton = () => {
    if (this.state.mapActive === false) {
      return (
        <button
          className="btn btn-primary map-button"
          onClick={this.handleButtonClick}
        >
          View on Map
        </button>
      )} else {
        return (
          <button
            className="btn btn-primary map-button"
            onClick={this.handleButtonClick}
          >
            Close Map
          </button>
        )
      }
    };

  render () {
    return (
      <div>
        {this.renderButton()}
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
