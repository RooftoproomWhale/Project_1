<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
body {
  padding-top: 100px;
}

.gridder {
  margin: 0px;
  padding: 0px;
  list-style-type: none
}

.gridder-list {
  display: inline-block;
  vertical-align: top
}

.gridder-show {
  display: block;
  float: left;
  width: 100%;
  position: relative;
  background: #EEE
}

.gridder-show.loading {
  background: #EEE url("../images/loading-spin.svg") no-repeat center
}

.gridder-content {
  display: none
}

.gridder-list {
  width: 15.83333%
}

.gridder-list:nth-child(n) {
  margin-bottom: 1%;
  margin-right: 1%
}

.gridder-list:nth-of-type(6n) {
  margin-right: 0;
  margin-bottom: 0
}

.gridder-show {
  padding: 20px;
  background: #EEE;
  margin-bottom: 1%
}

.gridder-navigation .gridder-nav.disabled {
  opacity: .5
}

.gridder-list {
  cursor: pointer
}

.gridder-list:hover {
  opacity: 0.8
}

.hasSelectedItem .gridder-list {
  opacity: .5
}

.hasSelectedItem .gridder-list.selectedItem {
  opacity: 1
}

.gridder {
  margin: 0px;
  padding: 0px;
  list-style-type: none;
  font-size: 0
}

.gridder-list,
.gridder-show {
  font-size: 16px
}

.gridder-list {
  display: inline-block;
  vertical-align: top
}

.gridder-show {
  display: block;
  float: left;
  width: 100%;
  position: relative
}

.gridder-content {
  display: none
}

.gridder-list {
  width: 15.83333%
}

.gridder-list:nth-child(n) {
  margin-bottom: 1%;
  margin-right: 1%
}

.gridder-list:nth-of-type(6n) {
  margin-right: 0;
  margin-bottom: 0
}
</style>

<div class="container text-center">
  <h1>Basic example</h1>
</div>

<div class="container">

  <ul class="gridder">
  	<c:forEach items="${medi1 }" var="medi" varStatus="i">
    	<li class="gridder-list" data-griddercontent="#gridder-content-${i.index}">
      		<img src='<c:url value="/img/medicine/${medi }.jpg"/>' class="img-responsive" />
    	</li>
  	</c:forEach>
  </ul>

	<c:forEach items="${medi1 }" var="medi" varStatus="i">
		<div id="gridder-content-${i.index }" class="gridder-content">
			<div class="row">
				<div class="col-sm-6">
					<img src='<c:url value="/img/medicine/${medi }.jpg"/>' class="img-responsive" />
				</div>
				<div class="col-sm-6">
					<h2>${medi}</h2>
					<p>성상: 알약</p>
					<p>효능: 진통제</p>
					<p>부작용: 무감각</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>


<script>
jQuery(document).ready(function($) {

	  // Call Gridder
	  $(".gridder").gridderExpander({
	    scrollOffset: 60,
	    scrollTo: "panel", // "panel" or "listitem"
	    animationSpeed: 400,
	    animationEasing: "easeInOutExpo",
	    onStart: function() {
	      console.log("Gridder Inititialized");
	    },
	    onExpanded: function(object) {
	      console.log("Gridder Expanded");
	      $(".carousel").carousel();
	    },
	    onChanged: function(object) {
	      console.log("Gridder Changed");
	    },
	    onClosed: function() {
	      console.log("Gridder Closed");
	    }
	  });
	});

	/*
	 *  Gridder - v1.4.1
	 *  A jQuery plugin that displays a thumbnail grid expanding preview similar to the effect seen on Google Images.
	 *  http://www.oriongunning.com/
	 *
	 *  Made by Orion Gunning
	 *  Under MIT License
	 */
	;
	(function($) {

	  //Ensures there will be no 'console is undefined' errors in IE
	  window.console = window.console || (function() {
	    var c = {};
	    c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile = c.clear = c.exception = c.trace = c.assert = function() {};
	    return c;
	  })();

	  /* Custom Easing */
	  $.fn.extend($.easing, {
	    def: "easeInOutExpo",
	    easeInOutExpo: function(e, f, a, h, g) {
	      if (f === 0) {
	        return a;
	      }
	      if (f === g) {
	        return a + h;
	      }
	      if ((f /= g / 2) < 1) {
	        return h / 2 * Math.pow(2, 10 * (f - 1)) + a;
	      }
	      return h / 2 * (-Math.pow(2, -10 * --f) + 2) + a;
	    }
	  });

	  /* KEYPRESS LEFT & RIGHT ARROW */
	  /* This will work only if a current gridder is opened. */
	  $(document).keydown(function(e) {
	    var keycode = e.keyCode;
	    var $current_gridder = $(".currentGridder");
	    var $current_target = $current_gridder.find(".gridder-show");
	    if ($current_gridder.length) {
	      if (keycode === 37) {
	        console.log("Pressed Left Arrow");
	        $current_target.prev().prev().trigger("click");
	        e.preventDefault();
	      }
	      if (keycode === 39) {
	        console.log("Pressed Right Arrow");
	        $current_target.next().trigger("click");
	        e.preventDefault();
	      }
	    } else {
	      console.log("No active gridder.");
	    }
	  });

	  $.fn.gridderExpander = function(options) {

	    /* GET DEFAULT OPTIONS OR USE THE ONE PASSED IN THE FUNCTION  */
	    var settings = $.extend({}, $.fn.gridderExpander.defaults, options);

	    return this.each(function() {

	      var mybloc;
	      var _this = $(this);
	      var visible = false;

	      // START CALLBACK
	      settings.onStart(_this);

	      // CLOSE FUNCTION
	      function closeExpander(base) {

	        // SCROLL TO CORRECT POSITION FIRST
	        if (settings.scroll) {
	          $("html, body").animate({
	            scrollTop: base.find(".selectedItem").offset().top - settings.scrollOffset
	          }, {
	            duration: 200,
	            easing: settings.animationEasing
	          });
	        }

	        _this.removeClass("hasSelectedItem");

	        // REMOVES GRIDDER EXPAND AREA
	        visible = false;
	        base.find(".selectedItem").removeClass("selectedItem");

	        base.find(".gridder-show").slideUp(settings.animationSpeed, settings.animationEasing, function() {
	          base.find(".gridder-show").remove();
	          settings.onClosed(base);
	        });

	        /* REMOVE CURRENT ACTIVE GRIDDER */
	        $(".currentGridder").removeClass("currentGridder");
	      }

	      // OPEN EXPANDER
	      function openExpander(myself) {

	        /* CURRENT ACTIVE GRIDDER */
	        $(".currentGridder").removeClass("currentGridder");
	        _this.addClass("currentGridder");

	        /* ENSURES THE CORRECT BLOC IS ACTIVE */
	        if (!myself.hasClass("selectedItem")) {
	          _this.find(".selectedItem").removeClass("selectedItem");
	          myself.addClass("selectedItem");
	        } else {
	          // THE SAME IS ALREADY OPEN, LET"S CLOSE IT
	          closeExpander(_this, settings);
	          return;
	        }

	        /* REMOVES PREVIOUS BLOC */
	        _this.find(".gridder-show").remove();

	        /* ADD CLASS TO THE GRIDDER CONTAINER
	         * So you can apply global style when item selected. 
	         */
	        if (!_this.hasClass("hasSelectedItem")) {
	          _this.addClass("hasSelectedItem");
	        }

	        /* ADD LOADING BLOC */
	        var $htmlcontent = $("<div class=\"gridder-show loading\"></div>");
	        mybloc = $htmlcontent.insertAfter(myself);

	        /* GET CONTENT VIA AJAX OR #ID*/
	        var thecontent = "";

	        if (myself.data("griddercontent").indexOf("#") === 0) {

	          // Load #ID Content
	          thecontent = $(myself.data("griddercontent")).html();
	          processContent(myself, thecontent);
	        } else {

	          // Load AJAX Content
	          $.ajax({
	            type: "POST",
	            url: myself.data("griddercontent"),
	            success: function(data) {
	              thecontent = data;
	              processContent(myself, thecontent);
	            },
	            error: function(request) {
	              thecontent = request.responseText;
	              processContent(myself, thecontent);
	            }
	          });
	        }
	      }

	      // PROCESS CONTENT
	      function processContent(myself, thecontent) {

	        /* FORMAT OUTPUT */
	        var htmlcontent = "<div class=\"gridder-padding\">";

	        if (settings.showNav) {

	          /* CHECK IF PREV AND NEXT BUTTON HAVE ITEMS */
	          var prevItem = ($(".selectedItem").prev());
	          var nextItem = ($(".selectedItem").next().next());

	          htmlcontent += "<div class=\"gridder-navigation\">";
	          htmlcontent += "<a href=\"#\" class=\"gridder-close\">" + settings.closeText + "</a>";
	          htmlcontent += "<a href=\"#\" class=\"gridder-nav prev " + (!prevItem.length ? "disabled" : "") + "\">" + settings.prevText + "</a>";
	          htmlcontent += "<a href=\"#\" class=\"gridder-nav next " + (!nextItem.length ? "disabled" : "") + "\">" + settings.nextText + "</a>";
	          htmlcontent += "</div>";
	        }

	        htmlcontent += "<div class=\"gridder-expanded-content\">";
	        htmlcontent += thecontent;
	        htmlcontent += "</div>";
	        htmlcontent += "</div>";

	        // IF EXPANDER IS ALREADY EXPANDED 
	        if (!visible) {
	          mybloc.hide().append(htmlcontent).slideDown(settings.animationSpeed, settings.animationEasing, function() {
	            visible = true;
	            /* AFTER EXPAND CALLBACK */
	            if ($.isFunction(settings.onContent)) {
	              settings.onContent(mybloc);
	            }
	          });
	        } else {
	          mybloc.html(htmlcontent);
	          mybloc.find(".gridder-padding").fadeIn(settings.animationSpeed, settings.animationEasing, function() {
	            visible = true;
	            /* CHANGED CALLBACK */
	            if ($.isFunction(settings.onContent)) {
	              settings.onContent(mybloc);
	            }
	          });
	        }

	        /* SCROLL TO CORRECT POSITION AFTER */
	        if (settings.scroll) {
	          var offset = (settings.scrollTo === "panel" ? myself.offset().top + myself.height() - settings.scrollOffset : myself.offset().top - settings.scrollOffset);
	          $("html, body").animate({
	            scrollTop: offset
	          }, {
	            duration: settings.animationSpeed,
	            easing: settings.animationEasing
	          });
	        }

	        /* REMOVE LOADING CLASS */
	        mybloc.removeClass("loading");
	      }

	      /* CLICK EVENT */
	      _this.find(".gridder-list").on("click", function(e) {
	        e.preventDefault();
	        var myself = $(this);
	        openExpander(myself);
	      });

	      /* NEXT BUTTON */
	      _this.on("click", ".gridder-nav.next", function(e) {
	        e.preventDefault();
	        $(this).parents(".gridder-show").next().trigger("click");
	      });

	      /* PREVIOUS BUTTON */
	      _this.on("click", ".gridder-nav.prev", function(e) {
	        e.preventDefault();
	        $(this).parents(".gridder-show").prev().prev().trigger("click");
	      });

	      /* CLOSE BUTTON */
	      _this.on("click", ".gridder-close", function(e) {
	        e.preventDefault();
	        closeExpander(_this);
	      });
	    });
	  };

	  // Default Options
	  $.fn.gridderExpander.defaults = {
	    scroll: true,
	    scrollOffset: 30,
	    scrollTo: "panel", // panel or listitem
	    animationSpeed: 400,
	    animationEasing: "easeInOutExpo",
	    showNav: true,
	    nextText: "Next",
	    prevText: "Previous",
	    closeText: "Close",
	    onStart: function() {},
	    onContent: function() {},
	    onClosed: function() {}
	  };

	})(jQuery);
</script>



