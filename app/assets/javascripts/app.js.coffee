@ewApp = angular.module("ewApp", ['ewApp.controllers', 'ewApp.services', 'rails', 'ngResource'])
  .config([ '$compileProvider', '$httpProvider', ($compileProvider, $httpProvider) ->
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|tel):/);
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])
@ewControllers = angular.module('ewApp.controllers', [])
@ewServices = angular.module('ewApp.services', [])
