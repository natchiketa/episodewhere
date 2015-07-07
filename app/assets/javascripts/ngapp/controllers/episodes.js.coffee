@ewControllers.controller 'EpisodesIndexController', ["$scope", "Episode", ($scope, Episode) ->
  Episode.query().then(
    (results) -> $scope.episodes = results
  )
]

