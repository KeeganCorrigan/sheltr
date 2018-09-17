import React from "react"
import PropTypes from "prop-types"

class CommentsDisplay extends React.Component {
  renderComments = () => {
    return (
      this.props.comments.map((comment) => {
        return (
          <div className="comment">
            <p>{comment.body}</p>
            <p className="comment-date">{comment.date}</p>
          </div>
        )
      })
    )
  }

  render () {
    return (
      <div className="comment-container">
        {this.renderComments()}
      </div>
    )
  }
}

CommentsDisplay.propTypes = {
  comments: PropTypes.array
}

export default CommentsDisplay
