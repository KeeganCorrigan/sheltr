import React from "react"
import PropTypes from "prop-types"
import Map from './Map'
import InfoForm from './InfoForm'
import CommentsDisplay from './CommentsDisplay'

class MapContainer extends React.Component {
  constructor(props) {
  super(props);
  this.state = {
    mapActive: false,
    formActive: false,
    commentsActive: false
  };
}
  renderMap() {
    console.log("comments yo!", this.props.comments)
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

  handleCommentsButtonClick = () => {
    const commentsActive = this.state.commentsActive ? false : true ;
    this.setState({commentsActive})
  };

  renderMapButton = () => {
    if (this.state.mapActive === false) {
      return (
        <button
          className="map-button btn"
          onClick={this.handleButtonClick}
        >
          <i className="fas fa-map-marked-alt"></i>  Map
        </button>
      )} else {
        return (
          <button
            className="map-button btn active-button"
            onClick={this.handleButtonClick}
          >
            <i className="fas fa-window-close"></i>  Map
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
            <i className="fas fa-plus"></i>  Info
          </button>
        )} else {
          return (
            <button
              className="map-button btn active-button"
              onClick={this.handleFormButtonClick}
            >
              <i className="fas fa-window-close"></i>  Info
            </button>
          )
        }
      };

      renderCommentsButton = () => {
        if (this.props.comments.length > 0) {
          if (this.state.commentsActive === false) {
            return (
              <button
                className="form-info-button btn"
                onClick={this.handleCommentsButtonClick}
              >
                <i className="far fa-comment"></i>  Comments
              </button>
            )} else {
              return (
                <button
                  className="map-button btn active-button"
                  onClick={this.handleCommentsButtonClick}
                >
                  <i className="fas fa-window-close"></i>  Comments
                </button>
              )
            }
          } else {
            return null
          };
        };

      renderComments() {
        if (this.state.commentsActive === true) {
          return (
            < CommentsDisplay comments={this.props.comments} />
          );
        } else {
          return null
        };
      }

      renderForm() {
        if (this.state.formActive === true) {
          return (
            < InfoForm placeId={this.props.placeId} />
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
          {this.renderCommentsButton()}
        </div>
          {this.renderMap()}
          {this.renderForm()}
          {this.renderComments()}
      </div>
    )
  }
}

MapContainer.propTypes = {
  googleApiKey: PropTypes.string,
  center: PropTypes.array,
  zoom: PropTypes.number,
  placeId: PropTypes.string,
  comments: PropTypes.array
};

export default MapContainer
