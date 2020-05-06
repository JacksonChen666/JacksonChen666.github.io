function randomQuotes(quotesList=["Oh hi, thanks for checking in im still a piece of garbage"], endQuote="Nobody", ElementId="random_quotes"){
	var quote = quotesList[Math.floor(Math.random() * quotesList.length)];
	document.getElementById(ElementId).innerHTML = "\"" + quote + "\" " + "-" + endQuote;
	return true;
}

function addQuotesListener(eventWithoutOn, ElementId, quotesList=["Oh hi, thanks for checking in im still a piece of garbage"], endQuote="Nobody"){
	document.getElementById(ElementId).addEventListener(eventWithoutOn, function(){randomQuotes(quotesList, endQuote)});
}

function constantRandomQuotes(quotesList=["Oh hi, thanks for checking in im still a piece of garbage"], endQuote="Nobody", ElementId="random_quotes", time=10000){
	randomQuotes(quotesList, endQuote, ElementId);
	setInterval(function(){randomQuotes(quotesList, endQuote, ElementId);}, time);
}