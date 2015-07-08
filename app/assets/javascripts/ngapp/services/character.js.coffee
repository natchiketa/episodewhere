@ewServices.factory 'Character', ['RailsResource', (RailsResource) ->
  class Character extends RailsResource
    @configure
      url: '/characters',
      name: 'character'
]

