var secondsPerDeath = 5.35;
var MILLIS_PER_SECOND = 1000;
var DEATH_UPDATE_INTERVAL = 10000;

// borrowed:
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function updateDeathToll(){
	var currentYear = new Date().getFullYear();
	var startOfYear = new Date(currentYear, 1, 1);
	var secondsThisYear = Math.abs(new Date() - startOfYear) / MILLIS_PER_SECOND;

	var deathsThisYear = secondsThisYear / secondsPerDeath;

	document.getElementById('tobaccoDeathsRecord').innerHTML =
		numberWithCommas(Math.floor(deathsThisYear)) + " deaths from tobacco this year.";
}

// updateDeathToll();
window.setInterval(function() { updateDeathToll() }, DEATH_UPDATE_INTERVAL);
$(document).ready(function() { updateDeathToll() });