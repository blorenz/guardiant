// Generated by CoffeeScript 1.7.1
var Slideshow;

Slideshow = (function() {
  var self;
  self = {};
  self.init = function(cfg) {
    var $firstSlide, w;
    w = $(".lozenge").width();
    $("#slides > div:gt(0)").hide();
    $firstSlide = $("#slides > div:first");
    $(".slideshow-nav .title").html($("img", $firstSlide).attr("title"));
    return $(".slideshow-nav a").on("click", function(e) {
      var $slide, $topSlide, href, order;
      e.preventDefault();
      debugger;
      $(".focused").removeClass("focused");
      $(e.currentTarget).addClass("focused");
      href = $(e.currentTarget).attr("data-href");
      $slide = $("div[data-id=" + href + "]").detach();
      $topSlide = $("#slides > div:first").after($slide).fadeOut(cfg.fadeOut).detach();
      $topSlide.appendTo("#slides");
      $(".lozenge a.active").removeClass("active");
      order = $slide.data("order");
      $(".lozenge a[data-order=" + order + "]").addClass("active");
      $(".slideshow-nav .title").html($("img", $slide).attr("title"));
      $slide.fadeIn(cfg.fadeIn);
    });
  };
  return self;
})();

//# sourceMappingURL=slideshow.map
