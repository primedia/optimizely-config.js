// Generated by CoffeeScript 1.7.1
(function() {
  describe("activeExperiments", function() {
    var activeExperiments, fakeOptimizelyData, specHelper;
    activeExperiments = null;
    fakeOptimizelyData = null;
    specHelper = null;
    beforeEach(function() {
      return require(['../../active-experiments', '../helpers/optimizelyHelper'], function(_activeExperiments, _specHelper) {
        activeExperiments = _activeExperiments;
        return specHelper = _specHelper;
      });
    });
    beforeEach(function() {
      var spy;
      return spy = spyOn(window, "optimizely").andReturn(specHelper.optimizelyData);
    });
    return describe('#collection', function() {
      return it('should collect experiments', function() {
        var experiments;
        experiments = {};
        activeExperiments.collection();
        return expects(window.rentPathExperiments).toEqual(experiments);
      });
    });
  });

}).call(this);