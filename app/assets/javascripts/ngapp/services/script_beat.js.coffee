@ewServices.factory 'ScriptBeat', ['RailsResource', (RailsResource) ->
  class ScriptBeat extends RailsResource
    @configure
      url: '/script_beats',
      name: 'script_beat'
]

