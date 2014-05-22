// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  define([], function() {
    var collection, exists, load;
    collection = function() {
      if (window.rentPathExperiments && window.rentPathExperiments.length > 0) {
        return window.rentPathExperiments;
      } else {
        return window.rentPathExperiments = load();
      }
    };
    exists = function(versionName) {
      var experiment, experiments, soVersionRegex, _i, _len, _ref;
      soVersionRegex = new RegExp(versionName, "i");
      experiments = collection();
      _ref = collection();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        experiment = _ref[_i];
        if (experiment.match(soVersionRegex)) {
          return true;
        }
      }
      return false;
    };
    load = function() {
      var allExperiments, curVar, experiments, mExp, oActiveExperiments, oData, optimizelyObj, _i, _len;
      if (!window.optimizely) {
        return [];
      }
      experiments = [];
      optimizelyObj = window.optimizely;
      oData = optimizelyObj.data;
      oActiveExperiments = oData.state.activeExperiments;
      allExperiments = optimizelyObj.allExperiments;
      for (_i = 0, _len = oActiveExperiments.length; _i < _len; _i++) {
        mExp = oActiveExperiments[_i];
        if (allExperiments[mExp].enabled) {
          curVar = oData.state.variationNamesMap[mExp];
          experiments.push(curVar);
        }
      }
      return experiments;
    };
    return {
      exists: exists
    };
  });

}).call(this);
