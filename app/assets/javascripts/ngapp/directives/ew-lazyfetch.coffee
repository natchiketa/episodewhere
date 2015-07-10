@ewDirectives.directive 'ewLazyfetch', [
  '$window',
  ($window) ->
    hash =
      link: (scope, element, attrs) ->
        fetchHandler = attrs.ewLazyfetch
        limit = attrs.ewFetchlimit

        $elem = $(angular.element(element))

        handler = _.throttle( ->
          elementBottomY = $elem.offset().top + $elem.height()
          windowBottom = window.innerHeight + window.scrollY
          if elementBottomY < windowBottom
            scope[fetchHandler](limit)
        , 1000
        )

        # Bind the handler
        angular.element($window).bind('scroll', handler)

        # Unbind the handler when the element is destroyed
        element.on '$destroy', ->
          angular.element($window).unbind('scroll', handler)
]

