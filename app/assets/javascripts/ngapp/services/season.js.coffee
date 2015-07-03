services = angular.module 'ewApp.services', []
services.factory 'Season', ['RailsResource', (RailsResource) ->
  class Season extends RailsResource
    @configure
      url: '/seasons',
      name: 'season'
]

