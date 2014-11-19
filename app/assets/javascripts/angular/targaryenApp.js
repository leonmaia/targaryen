(function(){
  var app = angular.module('App', []);
  
  app.controller('JourneyController', function() {
    this.journey = journey;
  });
  var journey = {
    name: 'Best Journey Ever',
    description: 'trip at ny'
  }
})();
