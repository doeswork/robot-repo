import React from "react"
import PropTypes from "prop-types"

const HelloWorld = (props) => {
  return (
    <React.Fragment>
      Greeting JSX: {props.greeting}
    </React.Fragment>
  )
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};

export default HelloWorld
