@ewControllers.controller 'EpisodeBeatsController', ["$scope", "Episode", "ScriptBeat", "Character", "Vlc", ($scope, Episode, ScriptBeat, Character, Vlc) ->
  $scope.playhead = null

  $scope.init = (epId) ->
    console.log "Fetching episode_id: #{epId}"
    $scope.vlc_service = new Vlc(serverErrorHandler).service
    Episode.get(epId).then( (ep) ->
      $scope.episode = ep
      checkVLC()
    )

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

