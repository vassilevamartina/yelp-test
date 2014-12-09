angular.module('spaApp', ['ui.router', 'templates', 'mgcrea.ngStrap']);

config(function($stateProvider, $urlRouterProvider) {

$urlRouterProvider.otherwise('/');

    $stateProvider

        .state('home', {
            url: '/home',
            templateUrl: 'home.html'
            template: '<h1>HOME VIEW</h1>',
            controller: 'homeController'
        })
        .state('about', {
            url: '/about',
            template: '<h1>HOME VIEW</h1>'
        });


})

.controller('homeController', function($scope, api) {

  api.getRestaurant()
  .then(function(data){
    $scope.data = data.data
  })

})

.service('api', function($http) {

     return {

          getRestaurant: function() {

               var promise = $http.get('/api/restaurants')
               .then(function(response) {
                    return response
               });
               return promise;
          }

     }

});