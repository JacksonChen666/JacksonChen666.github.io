defaultQList = ["<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/n0XaSvhTYd4?autoplay=1&controls=0&fs=0&loop=1&modestbranding=1&iv_load_policy=3\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>"]
defaultEQuote = "bill wurtz"

function randomQuotes(quotesList=defaultQList, endQuote=defaultEQuote, ElementId="random_quotes"){
	var quote = quotesList[Math.floor(Math.random() * quotesList.length)];
	document.getElementById(ElementId).innerHTML = "\"" + quote + "\" " + "-" + endQuote;
	return; 
}

function addQuotesListener(eventWithoutOn, ElementId, quotesList=defaultQList, endQuote=defaultEQuote){
	document.getElementById(ElementId).addEventListener(eventWithoutOn, function(){randomQuotes(quotesList, endQuote)});
	document.getElementById(ElementId).style.cursor = "pointer"; // yes, it is clickable from now on
}

function constantRandomQuotes(quotesList=defaultQList, endQuote=defaultEQuote, ElementId="random_quotes", time=10){
	randomQuotes(quotesList, endQuote, ElementId);
	if (quotesList != defaultQList && endQuote != defaultEQuote){
		setInterval(function(){randomQuotes(quotesList, endQuote, ElementId);}, time * 1000);
	}
}