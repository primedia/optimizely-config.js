'use strict';
define ['./active-experiments'], (activeExperiments) ->
  # For use as a mixin
  optimizelyConfig = ->

    activateExperiment = (experimentName, notMatch, callback, callbackArgs) ->
      if activeExperiments().isExperientMatch(experimentName, notMatch)
        return callback.apply(null, callbackArgs)

    isExperimentActive = (experimentName, notMatch) ->
      activeExperiments().isExperientMatch(experimentName, notMatch)

    return {
      activateExperiment: activateExperiment
      isExperimentActive: isExperimentActive
    }

  return optimizelyConfig
