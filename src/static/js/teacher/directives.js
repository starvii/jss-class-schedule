'use strict';

teacher.directive('myDirective', function() {
	return {
		restrict : 'E',
		controller : 'directiveCtrl',
		templateUrl : 'directive.html'
	}
});
