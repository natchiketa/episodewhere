@ewControllers.controller 'EpisodeBeatsController', ["$scope", "Episode", "ScriptBeat", "Character", "Vlc", ($scope, Episode, ScriptBeat, Character, Vlc) ->
  $scope.playhead = null

  $scope.init = (epId) ->
    console.log "Fetching episode_id: #{epId}"
    $scope.vlc_service = new Vlc(serverErrorHandler).service
    $scope.beat_service = ScriptBeat
    Episode.get(epId).then( (ep) ->
      $scope.episode = ep
      # checkVLC()
      ScriptBeat.query({episode_id: ep.id}).then((beats) -> $scope.beats = beats)
    )
    Character.query().then( (characters) ->
      $scope.characters = characters
    )

  $scope.hasCharacter = (beat, characterId) ->
    characterId = parseInt(characterId)
    charIdx = _.pluck(beat.characters, 'id').indexOf(characterId)
    charIdx > -1

  $scope.parseInt = parseInt

  $scope.updateBeatCharacters = (beat) ->
    beat.characterIds = _.map(
      beat.characterIds,
      (val) -> parseInt(val)
    )
    beat.update()


  $scope.connect = () ->
    $scope.vlc_service.connect({id: $scope.episode.id})

  $scope.play = (media) ->
    $scope.vlc_service.play
      id: $scope.episode.id
      media: media

  $scope.seek = (seconds) ->
    $scope.vlc_service.seek
      id: $scope.episode.id
      seconds: seconds

  checkVLC = =>
    $scope.vlc_service.time({id: $scope.episode.id}, (response) -> $scope.playhead = response.seconds )

    setTimeout(
      ->
        window.requestAnimationFrame(checkVLC)
      , 1000
    )

  $scope.beatIsActive = (beat) ->
    beat.startTime <= $scope.playhead and beat.endTime >= $scope.playhead

  serverErrorHandler = ->
    console.error "There was a server error, please reload the page and try again."
]

