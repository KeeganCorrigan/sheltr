import React from "react"
import axios from 'axios';
import PropTypes from "prop-types"

class InfoForm extends React.Component {
  state = {
    comment: '',
  }

  handleChange = event => {
    this.setState({ comment: event.target.value });
  }

  handleSubmit = event => {
    event.preventDefault();

    const comment = {
      comment: this.state.comment
  };

  axios.post(`https://jsonplaceholder.typicode.com/users`, { comment })
    .then(res => {
      console.log(res);
      console.log(res.data);
    })
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit} className="submit-form">
          <label>
            <h2>Comment:</h2>
            <textarea value={this.state.comment} onChange={this.handleChange} />
          </label>
          <br/>
          <button type="submit" className="btn btn-primary"><i class="far fa-comment"></i>  Add Comment</button>
        </form>
      </div>
    )
  }
}

InfoForm.propTypes = {
  placeId: PropTypes.string
}

export default InfoForm
