import React from "react"
import axios from 'axios';
import PropTypes from "prop-types"

class InfoForm extends React.Component {
  state = {
    comment: '',
    formSubmitted: false
  }

  handleChange = event => {
    this.setState({ comment: event.target.value });
  }

  handleSubmit = (event) => {
    event.preventDefault();

    const params = {
      body: this.state.comment,
      place_id: this.props.placeId
    };

    const formSubmitted = this.state.formSubmitted ? false : true ;
    this.setState({formSubmitted})

    axios.post(`https://hidden-savannah-17675.herokuapp.com/api/v1/comments`, params)
      .then(res => {
        console.log(res);
        console.log(res.data);
    })
  }

  renderForm = () => {
    if (this.state.formSubmitted === false) {
      return (
        <div>
          <form onSubmit={this.handleSubmit} className="submit-form">
            <label>
              <h2>Comment:</h2>
              <textarea value={this.state.comment} onChange={this.handleChange} />
            </label>
            <br/>
            <button type="submit" className="btn btn-primary"><i className="far fa-comment"></i>  Add Comment</button>
          </form>
        </div>
      )} else {
        return (
          <h2 className="form-comment-verification">Comment submitted for approval!</h2>
        )
      }
    };


  render() {
    return (
      <div>
        {this.renderForm()}
      </div>
    )
  }
}

InfoForm.propTypes = {
  placeId: PropTypes.string
}

export default InfoForm
