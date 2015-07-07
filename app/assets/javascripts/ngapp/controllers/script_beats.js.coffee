@ewControllers.controller 'ScriptBeatsIndexController', ["$scope", "ScriptBeat", ($scope, ScriptBeat) ->
  ScriptBeat.query().then(
    (results) -> $scope.scriptBeats = results
  )
]

