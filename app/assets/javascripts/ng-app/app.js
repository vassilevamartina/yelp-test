// angular.module('spaApp', ['ui.router', 'templates'])

// .config(function($stateProvider, $urlRouterProvider) {

// $urlRouterProvider.otherwise('/');

//     $stateProvider

//         .state('home', {
//             url: '/home',
//             templateUrl: 'home.html',
//             // template: 
//             // '<h6>phone: {{display_phone}}</h6>'
//             // '<h6>name: {{name}}</h6><h6>phone: {{display_phone}}</h6>',
//             controller: 'homeController'
//         })
//         .state('about', {
//             url: '/about',
//             template: '<h1>HOME VIEW</h1>'
//         });

// })

// .controller('homeController', function($scope, api) {


//   $scope.restaurantData = []

//   api.getRestaurant('McDonalds')
//   .then(function(data){
    
//     $scope.restaurantData = data.data
//   });

//   console.log($scope.restaurantData);

//   // api.getRestaurant('Mcdonalds')
//   // .then(function(data){
//   //   console.log(data.data);
//   //   $scope.display_phone = data.data.display_phone;
//   //   $scope.name = data.data.name;
//   //   $scope.display_address = data.data.location.display_address;
//   //   $scope.rating = data.data.rating_img_url;
//   //   $scope.url = data.data.url;
//   //   $scope.data = data.data;
//   // })

// })

// // .controller('pictureController', function($scope, )

// .service('api', function($http) {

//      return {

//           getRestaurant: function(searchFor) {

//                // var promise = $http.get('/restaurants/query', {params: {name: 'McDonalds'}})
//                var promise = $http.get('/restaurants/query', {params: {name: searchFor}})
//                .then(function(response) {
//                     return response;
//                });
//                return promise;
//           },

//           // getBusiness: function()

//      }

// });

