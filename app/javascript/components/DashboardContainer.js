import React from 'react'
import axios from 'axios'
import Comment from 'components/Comment'
import PropTypes from 'prop-types'

class DashboardContainer extends React.Component {
  constructor(props) {
  super(props);
  this.state = {
      comments: {}
    }
  }

  componentDidMount() {
    axios.get(`https://needsheltr.herokuapp.com/api/v1/dashboard`)
      .then(res => {
        const comments = res;
        this.setState({ comments });
      })
  }

  renderComments = () => {
    return (
      <div>
        {this.state.comments.data && this.state.comments.data.map(comment => {
          return (
            <Comment comment={comment} />
          )
      })}
      </div>
    )
  }


  render() {
    return (
      <div className="comments-approval-container">
        <h1> { this.state.comments.data && this.state.comments.data.length} Pending Comments </h1>

        {this.renderComments()}
      </div>
    )
  }
}

export default DashboardContainer
