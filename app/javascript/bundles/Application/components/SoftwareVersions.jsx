import PropTypes from 'prop-types';
import React from 'react';

export default class SoftwareVersions extends React.Component {
  static propTypes = {
    dbAdapter: PropTypes.string.isRequired, // this is passed from the Rails view
    dbHost: PropTypes.string.isRequired, // this is passed from the Rails view
    dbMigrationVersion: PropTypes.string.isRequired, // this is passed from the Rails view
    railsVersion: PropTypes.string.isRequired, // this is passed from the Rails view
    rubyPlatform: PropTypes.string.isRequired, // this is passed from the Rails view
    rubyVersion: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class
    this.state = {
      dbAdapter: this.props.dbAdapter,
      dbHost: this.props.dbHost,
      dbMigrationVersion: this.props.dbMigrationVersion,
      railsVersion: this.props.railsVersion,
      rubyPlatform: this.props.rubyPlatform,
      rubyVersion: this.props.rubyVersion,
    };
  }

  render() {
    return (
      <p className="version">
        <strong>Rails version:</strong> {this.state.railsVersion}<br />
        <strong>Ruby version:</strong> {this.state.rubyVersion} ({this.state.rubyPlatform})<br />
        <strong>Database Host:</strong> {this.state.dbHost} ({this.state.dbAdapter}, migration: {this.state.dbMigrationVersion})
      </p>
    );
  }
}
