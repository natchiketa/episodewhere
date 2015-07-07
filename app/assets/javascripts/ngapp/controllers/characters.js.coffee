@ewControllers.controller 'CharactersIndexController', ["$scope", "Character", ($scope, Character) ->
  Character.query().then(
    (results) -> $scope.characters = results
  )
]

