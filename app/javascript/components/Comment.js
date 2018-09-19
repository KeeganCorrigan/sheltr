import React from "react"
import axios from 'axios';
import PropTypes from "prop-types"


class Comment extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        approved: false,
        deleted: false
      }
    }

    deleteComment = event => {

      axios.delete(`https://hidden-savannah-17675.herokuapp.com/api/v1/comments/${event}`)
        .then(res => {
        })

      this.setState({deleted: true})
    };

    approveComment = event => {

      axios.patch(`https://hidden-savannah-17675.herokuapp.com/api/v1/comments/${event}`)
        .then(res => {
        })

      this.setState({approved: true})
    };

    render() {
      if (this.state.approved === false && this.state.deleted === false) {
        return (
          <div className="comment-approval-container">
            <p className="comment-created-at">Posted on {this.props.comment.created_at.split('T')[0]}</p>
            <p className="comment-text">{this.props.comment.body}</p>
            <div className="approval-buttons">
              <button className="btn approval-button" onClick={()=>{this.approveComment(this.props.comment.id)}}> <i className="far fa-thumbs-up"></i></button>
              <button className="btn approval-button" onClick={()=>{this.deleteComment(this.props.comment.id)}}> <i className="far fa-thumbs-down"></i></button>
            </div>
          </div>
      )} else if (this.state.approved === true) {
        return (
          <div className="comment-approval-container">
            <p className="comment-approved"><i className="far fa-check-circle"></i>   Comment approved</p>
          </div>
      )} else {
        return (
        <div className="comment-approval-container">
          <p className="comment-deleted"><i className="fas fa-minus-circle"></i>    Comment rejected</p>
        </div>
      )}
    };
  }

  Comment.propTypes = {
    comment: PropTypes.object
  };

  export default Comment
