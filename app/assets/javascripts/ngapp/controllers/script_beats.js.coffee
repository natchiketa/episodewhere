@ewControllers.controller 'ScriptBeatsIndexController', ["$scope", "TvShow", "Season",  "Episode", "ScriptBeat", "Character", ($scope, TvShow, Season, Episode, ScriptBeat, Character) ->
  ScriptBeat.query().then(
    (results) -> $scope.scriptBeats = results
  )

  $scope.init = ->
    return
]
