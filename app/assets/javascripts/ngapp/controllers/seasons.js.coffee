@ewControllers.controller 'SeasonsIndexController', ["$scope", "Season", ($scope, Season) ->
  Season.query().then(
    (results) -> $scope.seasons = results
  )
]

