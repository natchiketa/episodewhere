@ewServices.factory 'Vlc', [ '$resource', '$rootScope', '$http', ($resource, $rootScope, $http) ->
  class Vlc
    constructor: (errorHandler=(-> null)) ->
      actions =
        connect:
          method: 'GET'
          isArray: false
          params: {id: null, action: 'connect'}
        play:
          method: 'GET'
          isArray: false
          params: {id: null, action: 'play', media: null}
        time:
          method: 'GET'
          isArray: false
          params: {id: null, action: 'time'}
        seek:
          method: 'GET'
          isArray: false
          params: {id: null, action: 'seek', seconds: null}

      @service = $resource '/episodes/:id/beats/vlc/:action', null, actions
      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    connect: (params, successHandler) ->
      @service.connect(
        params,
        (
          (response) ->
            successHandler?(response)
            response
        ),
        @errorHandler
      )

    play: (params, successHandler) ->
      @service.play(
        params,
        (
          (response) ->
            successHandler?(response)
            response
        ),
        @errorHandler
      )

    time: (params, successHandler) ->
      @service.time(
        params,
        (
          (response) ->
            successHandler?(response)
            response
        ),
        @errorHandler
      )

    seek: (params, successHandler) ->
      @service.seek(
        params,
        (
          (response) ->
            successHandler?(response)
            response
        ),
        @errorHandler
      )
]



