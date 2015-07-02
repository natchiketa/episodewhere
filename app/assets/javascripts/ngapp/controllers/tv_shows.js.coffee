@ewControllers.controller 'TvShowsIndexController', ["$scope", "TvShow", ($scope, TvShow) ->
  TvShow.query().then(
    (results) -> $scope.tvShows = results
  )
]

