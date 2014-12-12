angular.module('spaApp', ['ui.router', 'templates'])

.config(function($stateProvider, $urlRouterProvider) {

$urlRouterProvider.otherwise('/');

    $stateProvider

        .state('home', {
            url: '/home',
            templateUrl: 'home.html',
            // template: 
            // '<h6>phone: {{display_phone}}</h6>'
            // '<h6>name: {{name}}</h6><h6>phone: {{display_phone}}</h6>',
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
    console.log(data.data);
    $scope.display_phone = data.data.display_phone;
    $scope.name = data.data.name;
    $scope.display_address = data.data.location.display_address;
    $scope.display_address = data.data.location.display_address;
    // $scope.data = data.data
  })

})

.service('api', function($http) {

     return {

          getRestaurant: function() {

               var promise = $http.get('/restaurants/query', {params: {name: 'McDonalds'}})
               .then(function(response) {
                    return response;
               });
               return promise;
          }

     }

});