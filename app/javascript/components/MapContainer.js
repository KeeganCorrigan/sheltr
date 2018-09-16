import React from "react"
import PropTypes from "prop-types"
import Map from './Map'
import InfoForm from './InfoForm'

class MapContainer extends React.Component {
  constructor(props) {
  super(props);
  this.state = {
    mapActive: false,
    formActive: false
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

  handleFormButtonClick = () => {
    const formActive = this.state.formActive ? false : true ;
    this.setState({formActive})
  };

  renderMapButton = () => {
    if (this.state.mapActive === false) {
      return (
        <button
          className="map-button btn"
          onClick={this.handleButtonClick}
        >
          <i className="fas fa-map-marked-alt"></i>  View on Map
        </button>
      )} else {
        return (
          <button
            className="map-button btn active-button"
            onClick={this.handleButtonClick}
          >
            <i className="fas fa-window-close"></i>  Close Map
          </button>
        )
      }
    };

    renderFormButton = () => {
      if (this.state.formActive === false) {
        return (
          <button
            className="form-info-button btn"
            onClick={this.handleFormButtonClick}
          >
            <i className="fas fa-plus"></i>  Add info
          </button>
        )} else {
          return (
            <button
              className="map-button btn active-button"
              onClick={this.handleFormButtonClick}
            >
              <i className="fas fa-window-close"></i>  Close info
            </button>
          )
        }
      };

      renderForm() {
        if (this.state.formActive === true) {
          return (
            < InfoForm placeId="1234" />
          );
        } else {
          return null
        };
      };

  render () {
    return (
      <div>
        <div className="button-row">
          {this.renderMapButton()}
          {this.renderFormButton()}
        </div>
          {this.renderMap()}
          {this.renderForm()}
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
