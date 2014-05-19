'use strict';
define [], ->

  activeExperiments = ->

    collection = ->
      window.rentPathExperiments ?= load()
      (window.rentPathExperiments || {})

    isEmpty = (obj) ->
      if obj? and (Object.keys(obj).length > 0) then false else true

    isExperientMatch = (experimentName, notMatch) ->
      soTestRegex      = new RegExp(experimentName, "i")
      soVariationRegex = new RegExp(notMatch, "i")

      for experiment, variation of collection()
        if (experiment.match(soTestRegex) and not variation.match(soVariationRegex))
          return true

      false

    load = ->
      return {} unless window.optimizely

      experiments        = {}
      optimizelyObj      = window.optimizely
      oData              = optimizelyObj.data
      oActiveExperiments = oData.state.activeExperiments
      allExperiments     = optimizelyObj.allExperiments
      i                  = 0

      for mExp, i in oActiveExperiments
        if allExperiments[mExp].enabled
          curTest = oData.experiments[mExp].name
          curVar  = oData.state.variationNamesMap[mExp]

          experiments[curTest] = curVar
        i++

      experiments

    return {
      isExperientMatch: isExperientMatch
    }

  return activeExperiments
