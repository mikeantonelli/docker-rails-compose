import PropTypes from 'prop-types';
import React from 'react';

export default class SoftwareVersions extends React.Component {
  static propTypes = {
    railsVersion: PropTypes.string.isRequired, // this is passed from the Rails view
    rubyPlatform: PropTypes.string.isRequired, // this is passed from the Rails view
    rubyVersion: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);
    debugger
    // How to set initial state in ES6 class syntax
    // https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class
    this.state = {
      railsVersion: this.props.railsVersion,
      rubyPlatform: this.props.rubyPlatform,
      rubyVersion: this.props.rubyVersion,
    };
  }

  render() {
    return (
      <p className="version">
        <strong>Rails version:</strong> {this.state.railsVersion}<br />
        <strong>Ruby version:</strong> {this.state.rubyVersion} ({this.state.rubyPlatform})
      </p>
    );
  }
}
