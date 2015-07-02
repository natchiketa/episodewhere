services = angular.module 'ewApp.services', []
services.factory 'TvShow', ['RailsResource', (RailsResource) ->
  class TvShow extends RailsResource
    @configure
      url: '/tv_shows',
      name: 'tvShow'
]

