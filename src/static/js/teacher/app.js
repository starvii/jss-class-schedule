'use strict';

var teacher = angular.module('teacher', []);

teacher.config([ '$routeProvider', function($routeProvider) {
	$routeProvider.when('/teacher/', {
		controller : 'ListCtrl',
		templateUrl : '/teacher/list.html'
	}).when('/edit/:id', {
		controller : 'EditCtrl',
		templateUrl : 'edit.html'
	}).when('/view/:id', {
		controller : 'ViewCtrl',
		templateUrl : 'view.html'
	}).when('/new', {
		controller : 'NewCtrl',
		templateUrl : 'edit.html'
	}).otherwise({
		redirectTo : '/'
	});
} ]);