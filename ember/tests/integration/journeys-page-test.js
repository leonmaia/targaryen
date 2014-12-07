import startApp from '../../tests/helpers/start-app';

var App, server;

module('Integration - Journey Page', {
  setup: function() {
    App = startApp();
    var journeys = [
      {
      id: 1,
      title: 'Bugs Bunny'
    },
    {
      id: 2,
      title: 'Wile E. Coyote'
    },
    {
      id: 3,
      title: 'Yosemite Sam'
    }
    ];

    server = new Pretender(function() {
      this.get('/api/journeys', function(request) {
        return [200, {"Content-Type": "application/json"}, JSON.stringify({journeys: journeys})];
      });

      this.get('/api/journeys/:id', function(request) {
        var journey = journeys.find(function(journey) {
          if (journey.id === parseInt(request.params.id, 10)) {
            return journey;
          }
        });

        return [200, {"Content-Type": "application/json"}, JSON.stringify({journey: journey})];
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
    equal(find('a:contains("Bugs Bunny")').length, 1);
    equal(find('a:contains("Wile E. Coyote")').length, 1);
    equal(find('a:contains("Yosemite Sam")').length, 1);
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