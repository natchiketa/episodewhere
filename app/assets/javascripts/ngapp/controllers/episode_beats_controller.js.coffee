@ewControllers.controller 'EpisodeBeatsController', ["$scope", "Episode", "ScriptBeat", "Character", "Vlc", ($scope, Episode, ScriptBeat, Character, Vlc) ->
  $scope.playhead = null
  $scope.expandedBeatId = null
  $scope.FETCH_SIZE = 100
  $scope.beats = []
  $scope.presetIndices = [0,1,2,3,4,5]
  $scope.speedCast = [null,null,null,null,null,null]

  $scope.init = (epId) ->
    console.log "Fetching episode_id: #{epId}"
    $scope.vlc_service = new Vlc(serverErrorHandler).service
    $scope.beat_service = ScriptBeat
    Episode.get(epId).then( (ep) ->
      $scope.episode = ep
      checkVLC()
      $scope.fetchBeats($scope.FETCH_SIZE)
    )
    Character.query().then( (characters) ->
      $scope.characters = characters
    )

  $scope.fetchBeats = (limit=$scope.FETCH_SIZE) ->
    $scope.beat_service
      .query(
        episode_id: $scope.episode.id
        limit_to: limit
        skip_to: $scope.beats.length
      )
      .then( (data) ->
        $scope.beats = $scope.beats.concat(data)
      )

  $scope.parseInt = parseInt

  $scope.timestamp = (seconds) ->
    date = new Date(null)
    date.setSeconds(seconds)

    utc  = date.toUTCString()
    time = utc.substr(utc.indexOf(':') - 2, 8)

  $scope.connect = () ->
    $scope.vlc_service.connect({id: $scope.episode.id})

  $scope.play = (media) ->
    $scope.vlc_service.play
      id: $scope.episode.id
      media: media

  $scope.pause = () ->
    $scope.vlc_service.pause
      id: $scope.episode.id

  $scope.seek = (seconds) ->
    $scope.vlc_service.seek
      id: $scope.episode.id
      seconds: seconds

  checkVLC = =>
    $scope.vlc_service
      .time(
        {id: $scope.episode.id},
        (response) ->
          $scope.playhead = response.seconds
          nextTimeout = response.seconds
      )

    setTimeout(
      ->
        window.requestAnimationFrame(checkVLC)
      , 1000
    )

  $scope.beatIsActive = (beat) ->
    beat.startTime <= $scope.playhead and beat.endTime >= $scope.playhead

  $scope.toggleBeat = (beat, event) ->
    return if event?.target?.tagName in ['INPUT', 'A']

    $scope.expandedBeatId = if $scope.expandedBeatId == beat.id then null else beat.id

  $scope.onKey = (event) ->
    k = event.which
    console.debug("event.which: #{k}")
    return unless k in [9, 32, 49, 50, 51, 52, 53, 54]

    if k == 9
      currentBeat = angular.element(event.target).scope()?.beat
      shift = event.shiftKey

      beatIndex = _.findIndex($scope.beats, currentBeat)
      newBeatIdx = if shift then beatIndex - 1 else beatIndex + 1

      if newBeatIdx >= 0 and newBeatIdx < $scope.beats.length
        newBeat = $scope.beats[newBeatIdx]
        $scope.toggleBeat(newBeat)
        unless $scope.beatIsActive(newBeat)
          $scope.seek(newBeat.startTime)

    if k == 32
      if event.ctrlKey
        event.preventDefault()
        $scope.pause()

    if k in [49, 50, 51, 52, 53, 54]
      speedCastIndex = k - 49
      if event.ctrlKey
        event.preventDefault()
        currentBeat = angular.element(event.target).scope()?.beat
        beatIndex = _.findIndex($scope.beats, currentBeat)
        $scope.beats[beatIndex].characters = _.union(
          $scope.beats[beatIndex].characters,
          [$scope.speedCast[speedCastIndex].selected]
        )


  serverErrorHandler = ->
    console.error "There was a server error, please reload the page and try again."
]

