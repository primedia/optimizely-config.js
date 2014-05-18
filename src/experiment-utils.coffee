'use strict';
define [], ->

  experementUtil = ->

    getActiveExperiments = ->
      return {} if isEmpty(window.rentPathExperiments)
      (window.rentPathExperiments || {})

    isEmpty = (obj) ->
      if obj? and (Object.keys(obj).length > 0) then false else true

    isExperientMatch = (experimentName, notMatch) ->
      window.rentPathExperiments ||= loadActiveExperiments()
      return false if isEmpty(window.rentPathExperiments)

      soTestRegex                  = new RegExp(experimentName, "i")
      soVariationRegex             = new RegExp(notMatch, "i")

      for experiment, variation of getActiveExperiments()

        if (experiment.match(soTestRegex) and not variation.match(soVariationRegex))
          return true

      false

    loadActiveExperiments = ->
      return {} unless window.optimizely

      rentPathActiveExperiments = {}
      optimizelyObj             = window.optimizely
      oData                     = optimizelyObj.data
      activeExperiments         = oData.state.activeExperiments
      allExperiments            = optimizelyObj.allExperiments
      i                         = 0

      while i < (activeExperiments.length)
        mExp = activeExperiments[i]
        if allExperiments[mExp].enabled
          curTest = oData.experiments[mExp].name
          curVar  = oData.state.variationNamesMap[mExp]

          rentPathActiveExperiments[curTest] = curVar
        i++

      rentPathActiveExperiments

    return {
      isExperientMatch: isExperientMatch
    }

  return experementUtil
