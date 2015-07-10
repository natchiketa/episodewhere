@ewControllers.controller 'CharactersIndexController', ["$scope", "Character", ($scope, Character) ->
  $scope.init = () ->
    Character.query().then(
      (results) -> $scope.characters = results
    )

  $scope.remove = (character) ->
    index = $scope.characters.indexOf(character)
    $scope.characters.splice(index,1)
    character.delete()
]

