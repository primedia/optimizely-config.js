'use strict';
define ['./active-experiments'], (activeExperiments) ->
  # For use as a mixin
  optimizelyConfig = ->

    activateExperiment = (experimentName, notMatch, callback, callbackArgs) ->
      if activeExperiments().isExperientMatch(experimentName, notMatch)
        return callback.apply(null, callbackArgs)

    isExperementActive = (experimentName, notMatch) ->
      activeExperiments().isExperientMatch(experimentName, notMatch)

    return {
      activateExperiment: activateExperiment
      isExperementActive: isExperementActive
    }

  return optimizelyConfig
