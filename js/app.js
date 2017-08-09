var app = angular.module("app",["ngRoute","ngResource"])

.config(['$routeProvider',function($routeProvider){
	$routeProvider.when('/home',{
		templateUrl: 'content/workers.html',
		controller:	'HomeController'
	})
	.when('/edit/:id',{
		templateUrl: 'content/editworker.html',
		controller:	'EditController'
	})
	.when('/create',{
		templateUrl: 'content/createworker.html',
		controller:	'CreateController'
	})
	.otherwise({
		redirectTo: '/home'
	});

}])

.controller('HomeController',['$scope','workers','$route', function($scope,workers,$route){
	workers.get(function(data){
		$scope.workers = data.workers;
	})
}])

.controller('EditController',['$scope','workers','$routeParams', function($scope,workers,$routeParams){
	var id = $routeParams.id;
	$scope.settings = {
		pageTitle: "Editar Trabajador",
		action: "Edit"
	}
	workers.get({id:id},function(data){
		$scope.worker = data.worker;
	})

	$scope.submit = function(){
		// console.log($scope.worker.id);
		workers.update({id:$scope.worker.id}, $scope.worker).$promise.then(function(data){
			if(data.msg){
				$scope.settings.success = "Trabajador editado correctamente";
			}
		})
	}
}])

.controller('CreateController',['$scope','workers', function($scope,workers){
	$scope.settings = {
		pageTitle: "Crear Trabajador",
		action: "Crear"
	}
	$scope.worker = {
		nomtra: "",
		apepattra: "",
		apemattra: "",
		dirtra: "",
		teltra: "",
		emailtra: ""
	}
	$scope.submit = function(){
		workers.save($scope.worker).$promise.then(function(data){
			if(data.msg){
				angular.copy({},$scope.worker);
				$scope.settings.success = "Trabajador registrado correctamente";
			}
		})
	}
}])

.factory('workers',function($resource){
	return $resource('http://localhost/pruebakobsa/public/workers/:id', {id:"@_id"}, {
		update: {method: "PUT", params:{id: "@id"}}
	})
})