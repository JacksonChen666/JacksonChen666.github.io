function randomQuotes(quotesList=["Oh hi, thanks for checking in im still a piece of garbage"], endQuote="-Nobody", ElementId="random_quotes"){
	var quote = quotesList[Math.floor(Math.random() * quotesList.length)];
	document.getElementById(ElementId).innerHTML = "\"" + quote + "\" " + endQuote;
	return true;
}