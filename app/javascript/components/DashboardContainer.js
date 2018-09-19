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
    axios.get(`https://hidden-savannah-17675.herokuapp.com/api/v1/dashboard`)
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

// { this.state.comments.data && this.state.comments.data.map(comment => <div className="comment-approval-container">
//   <p className="comment-created-at">Posted on {comment.created_at.split('T')[0]}</p>
//   <p className="comment-text">"{comment.body}"</p>
//   <div className="approval-buttons">
//     <button className="btn approval-button" onClick={()=>{this.approveComment(comment.id)}}> <i className="far fa-thumbs-up"></i></button>
//     <button className="btn approval-button" onClick={()=>{this.deleteComment(comment.id)}}> <i className="far fa-thumbs-down"></i></button>
//   </div>
//
// </div>)}
