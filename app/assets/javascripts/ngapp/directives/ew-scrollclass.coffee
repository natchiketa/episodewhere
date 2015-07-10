@ewDirectives.directive 'ewScrollclass', [
  '$window',
  ($window) ->
    hash =
      link: (scope, element, attrs) ->
        cssClass = attrs.ewScrollclass
        whenAtTop = attrs.ewWhenattop == 'true'
        throttling = parseInt(attrs.ewThrottling) || 500

        elementTopY = $(angular.element(element)).offset().top

        handler = _.throttle ->
          windowScrollY = window.scrollY

          toggleExpr = switch
            when whenAtTop
              windowScrollY >= elementTopY
            else
              windowScrollY > 0

          $(angular.element(element)).toggleClass(cssClass, toggleExpr)
        , throttling

        # Bind the handler
        angular.element($window).bind('scroll', handler)

        # Unbind the handler when the element is destroyed
        element.on '$destroy', ->
          angular.element($window).unbind('scroll', handler)
]

