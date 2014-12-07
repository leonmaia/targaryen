import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('journeys', function() {
    this.route('show', { path: ':journey_id' });
  });
});

export default Router;
