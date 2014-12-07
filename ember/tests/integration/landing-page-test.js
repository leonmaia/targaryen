import startApp from '../../tests/helpers/start-app';

var App;

module('Integration - Landing Page', {
  setup: function() {
      App = startApp();
    },
  teardown: function() {
    App.reset();
    }
});

test('Should welcome me to Targaryen App', function() {
  visit('/').then(function() {
      equal(find('h2#title').text(), 'Welcome to Targaryen App');
    });
});

test('Should allow navigating back to root from another page', function() {
  visit('/journeys').then(function() {
      click('a:contains("Home")').then(function() {
            notEqual(find('h3').text(), 'Journeys');
          });
    });
});