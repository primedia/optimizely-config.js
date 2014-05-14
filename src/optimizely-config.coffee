define [], ->
  # For use as a mixin
  ->
    @_activateOptimizelyExperiment = (testName, notMatch, callback, callbackArgs)->
      oData = window.optimizely.data
      activeExperiments = oData.state.activeExperiments
      mCnt = activeExperiments.length
      mTest = ''
      mVars = ''
      mExp = ''
      tCount = 0
      soTestRegex = new RegExp(testName, 'i')
      soVariationRegex = new RegExp(notMatch, 'i')
      i = 0

      while i < (mCnt)
        mExp = activeExperiments[i]
        curTest = oData.experiments[mExp].name
        curVar = oData.state.variationNamesMap[mExp]
        if tCount > 0
          mTest += ' : '
          mVars += ' : '
        mTest += curTest
        mVars += curVar
        tCount += 1
        i++

      if mTest.match(soTestRegex) and not mVars.match(soVariationRegex)
        callback.apply(null,callbackArgs)

