// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-cal
//= require gmaps4rails/googlemaps.js

$(function() {
  $("#location_date").datepicker();
	$("#date").datepicker();
	
	var calendarPicker1 = $("#dsel1").calendarPicker({
	    months:0,
		  days:3,
	    showDayArrows:false,
	    
		callback:function(cal) {
				$("#currentDate").html("Selected date: " + cal.currentDate.toDateString());
		}});
		
		//---------CUSTOM INFO BOX ------------------------------------
		
		Gmaps.map.infobox = function(boxText) {
		  return {
		    content: boxText,
				disableAutoPan: false,
				maxWidth: 0,
				pixelOffset: new google.maps.Size(-140, 0),
				zIndex: null,
				boxStyle: { 
		    	background: "url('http://google-maps-utility-library-v3.googlecode.com/svn/tags/infobox/1.1.5/examples/tipbox.gif') no-repeat",
					opacity: 0.75,
					width: "280px"
		    },
				closeBoxMargin: "12px 6px 2px 2px",
				closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
				infoBoxClearance: new google.maps.Size(1, 1),
				isHidden: false,
				pane: "floatPane",
				enableEventPropagation: false
		 }};
});
  