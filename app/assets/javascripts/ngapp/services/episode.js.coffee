@ewServices.factory 'Episode', ['RailsResource', (RailsResource) ->
  class Episode extends RailsResource
    @configure
      url: '/episodes',
      name: 'episode'
]

