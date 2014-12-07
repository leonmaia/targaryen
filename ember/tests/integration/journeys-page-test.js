import startApp from '../../tests/helpers/start-app';

var App, server;

module('Integration - Journey Page', {
  setup: function() {
    App = startApp();
    var journeys = [
      { id: 1, title: 'Bugs Bunny', location_ids: [1,2] },
      { id: 2, title: 'Wile E. Coyote', location_ids: [3] },
      { id: 3, title: 'Yosemite Sam', location_ids: [4,5,6] }
    ];

    var locations = [
      { id: 1, venue_id: "What's up with Docs?", journey_id: 1 },
      { id: 2, venue_id: "Of course, you know, this means war.", journey_id: 1 },
      { id: 3, venue_id: "Getting the most from the Acme categlog.", journey_id: 2 },
      { id: 4, venue_id: "Shaaaad up!", journey_id: 3 },
      { id: 5, venue_id: "Ah hates rabbits.", journey_id: 3 },
      { id: 6, venue_id: "The Great horni-todes", journey_id: 3 }
    ];

    server = new Pretender(function() {
      this.get('/api/journeys', function(request) {
        return [200, {"Content-Type": "application/json"}, JSON.stringify({journeys: journeys, locations: locations})];
      });

      this.get('/api/journeys/:id', function(request) {
        var journey = journeys.find(function(journey) {
          if (journey.id === parseInt(request.params.id, 10)) {
            return journey;
          }
        });

        return [200, {"Content-Type": "application/json"}, JSON.stringify({journey: journey, locations: locations})];
      });
    });

  },
  teardown: function() {
    Ember.run(App, 'destroy');
    server.shutdown();
  }
});

test('Should allow navigation to the journeys page from the landing page', function() {
  visit('/').then(function() {
    click('a:contains("Journeys")').then(function() {
      equal(find('h3').text(), 'Journeys');
    });
  });
});

test('Should list all journeys', function() {
  visit('/journeys').then(function() {
    equal(find('a:contains("Bugs Bunny (2)")').length, 1);
    equal(find('a:contains("Wile E. Coyote (1)")').length, 1);
    equal(find('a:contains("Yosemite Sam (3)")').length, 1);
  });
});

test('Should be able to navigate to a journey page', function() {
  visit('/journeys').then(function() {
    click('a:contains("Bugs Bunny")').then(function() {
      equal(find('h4').text(), 'Bugs Bunny');
    });
  });
});

test('Should be able visit a journey page', function() {
  visit('/journeys/1').then(function() {
    equal(find('h4').text(), 'Bugs Bunny');
  });
});